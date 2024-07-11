# frozen_string_literal: true

module ChargifyWrapper
  class Base < ActiveResource::Base
    self.include_root_in_json = true

    private

    def handle_errors(&block)
      yield if block_given?
    rescue ActiveResource::ResourceInvalid => e
      body = JSON.parse(e.response.body)
      errors = body.fetch(self.class.element_name) { body['errors'] }

      self.errors.from_array(errors)

      self
    end
  end
end
