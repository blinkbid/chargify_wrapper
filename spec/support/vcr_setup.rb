# frozen_string_literal: true

require 'base64'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock

  config.allow_http_connections_when_no_cassette = false
  config.default_cassette_options = {
    drop_unused_requests: true,
    match_requests_on: [
      :method,
      :body_as_json
    ]
  }

  config.filter_sensitive_data("<CHARGIFY_SUBDOMAIN>") do
    ENV.fetch('SUBDOMAIN', 'test')
  end

  config.filter_sensitive_data("<CHARGIFY_API_KEY>") do |interaction|
    interaction.request.headers['Authorization']
  end
end

module VcrSetup
  def handle_vcr(example)
    name = example.metadata[:cassette] || cassete_name(example)

    VCR.turned_on do
      VCR.use_cassette(
        name,
        record: :once,
        match_requests_on: match_on(example)
      ) { example.call }
    end
  end

  def cassete_name(example)
    example
      .metadata[:full_description]
      .split(/\s+/, 2)
      .join('/')
      .underscore
      .gsub(%r{[^\w/]+}, '_')
  end

  def match_on(example)
    default_match_on =
      VCR
      .configuration
      .default_cassette_options[:match_requests_on]

    example.metadata[:match_requests_on] || default_match_on
  end
end
