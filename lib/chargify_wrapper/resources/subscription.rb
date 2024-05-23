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
  end
end
