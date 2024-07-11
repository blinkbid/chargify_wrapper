# frozen_string_literal: true

module ChargifyWrapper
  class Coupon < Base
    class << self
      def validate(code, product_family_id: nil)
        params = {code: code}

        params[:product_family_id] = product_family_id if product_family_id

        get(:validate, params)
      end
    end
  end
end
