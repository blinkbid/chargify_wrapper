# frozen_string_literal: true

module ChargifyWrapper
  class Subscription < Base
    has_many :payment_profiles

    def delayed_cancel(attrs = {})
      post(
        :delayed_cancel, nil,
        {
          cancellation_message: attrs[:reason],
          reason_code: attrs[:code]
        }.to_json(root: :subscription)
      )
    end

    def change_default_payment_profile(params = {})
      payment_profiles.find(:one, params).change_payment_profile
    end
  end
end
