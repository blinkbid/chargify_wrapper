# frozen_string_literal: true

require "spec_helper"

RSpec.describe ChargifyWrapper::Subscription do
  describe "#delayed_cancel", :vcr do
    let(:subscription) { described_class.find(75901562) }

    context "when subscription is active" do
      it "returns http status 200" do
        expect(subscription.delayed_cancel).to be_a(Net::HTTPOK)
      end
    end

    context "when subscription is invalid" do
      let(:subscription_invalid) do
        described_class.new({
          id: 1,
          state: "active",
          customer: {
            id: 70337947,
            first_name: "Chargify",
            last_name: "Wrapper",
            organization: "BlinkBid",
            email: "Chargify@example.com"
          },
          product: {
            id: 6459786,
            name: "Lite-Annual-T",
            handle: "lite-annual-trial"
          }
        })
      end

      it "return http status 404" do
        expect { subscription_invalid.delayed_cancel }.to raise_error(ActiveResource::ResourceNotFound)
      end
    end
  end
end
