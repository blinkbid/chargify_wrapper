  # frozen_string_literal: true

module ChargifyWrapper
  class Subscription < Base
    def delayed_cancel(reason = nil, code = nil)
      self.post(:delayed_cancel, nil, {subscription: {cancellation_message: reason, reason_code: code}}.to_json)
    end
  end
end
