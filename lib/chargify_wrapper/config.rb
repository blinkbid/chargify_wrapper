# frozen_string_literal: true

module ChargifyWrapper
  class << self
    attr_accessor :subdomain, :api_key

    def configure
      yield self

      self.subdomain = subdomain || "test"
      self.api_key = api_key

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
    end
  end
end
