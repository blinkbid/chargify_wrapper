module ChargifyWrapper
  class PaymentProfile < Base
    belongs_to :subscription
  end
end
