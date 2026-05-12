# frozen_string_literal: true

module ChargifyWrapper
  class Subscription < Base
    def delayed_cancel(attrs = {})
      post(
        :delayed_cancel, nil,
        {
          cancellation_message: attrs[:reason],
          reason_code: attrs[:code]
        }.to_json(root: :subscription)
      )
    end

    def change_default_payment_profile(payment_profile)
      post("payment_profiles/#{payment_profile.id}/change_payment_profile")
    end

    def reactivate(attrs = {})
      put(
        :reactivate, nil,
        attrs.to_json(root: :subscription)
      )
    end

    def apply_coupons(codes:)
      post(:add_coupon, nil, {codes: codes}.to_json)
    end

    def remove_coupon(code:)
      delete(:remove_coupon, coupon_code: code)
    end
  end
end
