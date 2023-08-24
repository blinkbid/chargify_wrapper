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
    end
  end
end
