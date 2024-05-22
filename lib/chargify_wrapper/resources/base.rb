# frozen_string_literal: true

module ChargifyWrapper
  class Base < ActiveResource::Base
    self.include_root_in_json = true
  end
end
