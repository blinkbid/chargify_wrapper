# frozen_string_literal: true

require "active_support"
require "active_support/time"
require "httplog"

module ChargifyWrapper
  class << self
    attr_accessor :subdomain, :api_key, :log_requests

    def configure
      yield self

      self.subdomain = subdomain || "test"
      self.api_key = api_key
      self.log_requests = log_requests || false

      Base.site = "https://#{subdomain}.chargify.com"
      Base.user = api_key
      Base.password = "X"
      Base.format = ActiveResource::Formats::JsonFormat

      setup
    end

    private

    def setup
      Time.zone = "UTC"
      ActiveSupport::JSON::Encoding.use_standard_json_time_format = true
      ActiveSupport.parse_json_times = true

      HttpLog.configure do |config|
        config.enabled = log_requests
        config.log_response = false
      end
    end
  end
end
