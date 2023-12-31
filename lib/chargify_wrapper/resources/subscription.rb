# frozen_string_literal: true

module ChargifyWrapper
  class Subscription < Base
    self.include_root_in_json = true

    def delayed_cancel(attrs = {})
      post(
        :delayed_cancel, nil,
        {
          cancellation_message: attrs[:reason],
          reason_code: attrs[:code]
        }.to_xml(root: :subscription)
      )
    end
  end
end
