# frozen_string_literal: true

module ChargifyWrapper
  class Base < ActiveResource::Base
    self.include_root_in_json = true

    private

    def handle_errors(&block)
      yield if block
    rescue ActiveResource::ResourceInvalid => e
      body = JSON.parse(e.response.body)
      errors = body.fetch(self.class.element_name, "errors")

      self.errors.from_array(errors)

      self
    end
  end
end
