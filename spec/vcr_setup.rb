require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.default_cassette_options = {
    drop_unused_requests: true
  }
end
