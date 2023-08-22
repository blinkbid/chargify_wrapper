# frozen_string_literal: true

require "spec_helper"

RSpec.describe ChargifyWrapper::Subscription do
  describe "#delayed_cancel" do
    let(:subscription_params) do
      {
        product_handle: "lite-annual-trial",
        customer_attributes: {
          first_name: "Chargify",
          last_name: "Wrapper",
          email: "chargify@example.com",
          zip: "02120",
          state: "MA",
          phone: "(617) 111 - 0000",
          organization: "BlinkBid",
          country: "US",
          city: "Boston",
          address_2: nil,
          address: "123 Mass Ave."
        }
      }
    end
    let(:subscription) { described_class.find(67573194) }

    context "when subscription is active" do
      before do
        VCR.use_cassette("subscription/active") do
          described_class.create(subscription_params)
        end
      end

      it "returns http status 200" do
        VCR.use_cassette("subscription/delayed_cancel/active") do
          expect(subscription.delayed_cancel).to be_a(Net::HTTPOK)
        end
      end
    end
  end
end
