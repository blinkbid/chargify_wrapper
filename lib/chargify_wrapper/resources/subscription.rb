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

    def reactivate_subscription(attrs = {})
      handle_errors do
        put(
          :reactivate, nil,
          attrs.to_json(root: :subscription)
        )
      end
    end
  end
end
