# frozen_string_literal: true

require "chargify_wrapper"
require "webmock/rspec"
require "rubygems"
require "dotenv/load"
require "support/vcr_setup"

RSpec.configure do |config|
  include VcrSetup

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each, :vcr) { |example| handle_vcr(example) }
end

WebMock.disable_net_connect!

ChargifyWrapper.configure do |config|
  config.subdomain = ENV["SUBDOMAIN"]
  config.api_key = ENV["API_KEY"]
end
