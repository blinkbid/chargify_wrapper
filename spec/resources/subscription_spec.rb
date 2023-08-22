# frozen_string_literal: true

RSpec.describe ChargifyWrapper::Subscription do
  new_subscription = {
      "product_handle": "lite-annual-trial",
      "customer_attributes": {
        "first_name": "Chargify",
        "last_name": "Wrapper",
        "email": "Chargify@example.com",
        "zip": "02120",
        "state": "MA",
        "reference": "XYZ",
        "phone": "(617) 111 - 0000",
        "organization": "BlinkBid",
        "country": "US",
        "city": "Boston",
        "address_2": nil,
        "address": "123 Mass Ave."
      }
    }

  let!(:subscription) { VCR.use_cassette("subscription_active") { ChargifyWrapper::Subscription.create(new_subscription) } }

  context "when subscription is active and request delayed_cancel" do
    it "return http status 200" do
      VCR.use_cassette("delayed_cancel_active") do
        subs = described_class.find(67573194)
        expect(subs.delayed_cancel).to have_http_status(200)
      end
    end
  end

#   context "when subscription is canceled and request delayed_cancel" do
#     it "return http status 422" do
#       VCR.use_cassette("delayed_cancel_canceled") do
#         subs = described_class.find(67562290)
#         expect(subs.delayed_cancel).to have_http_status(422)
#       end
#     end
#   end
end
