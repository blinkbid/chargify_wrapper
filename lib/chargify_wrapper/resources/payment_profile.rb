module ChargifyWrapper
  class PaymentProfile < Base
    belongs_to :subscription

    def change_payment_profile
      post(:change_payment_profile)
    end
  end
end
