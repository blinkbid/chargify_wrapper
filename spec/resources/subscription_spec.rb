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

  describe "#change_default_payment_profile", :vcr do
    subject(:change_payment_profile) { subscription.change_default_payment_profile(payment_profile) }

    let(:payment_profile) do
      ChargifyWrapper::PaymentProfile.create({
        payment_profile: {
          first_name: "Joao",
          last_name: "Das Neves",
          last_four: "3858",
          card_type: "visa",
          expiration_month: 11,
          expiration_year: 2034,
          customer_id: 80219272,
          current_vault: "bogus",
          vault_token: "1",
          billing_address: "123 Main St.",
          billing_city: "Boston",
          billing_state: "MA",
          billing_zip: "02120",
          billing_country: "US",
          billing_address_2: "Addd2",
          payment_type: "credit_card"
        }
      })
    end

    context "when payment profile is valid" do
      let(:subscription) { described_class.find(76354749) }

      it "returns http status 200" do
        expect(change_payment_profile).to be_a(Net::HTTPOK)
      end

      it "changes the default payment profile" do
        parsed_response = JSON.parse(change_payment_profile.body)
        expect(parsed_response["payment_profile"]["id"]).to eq(payment_profile.id)
      end
    end

    context "when subscription is not found" do
      let(:subscription) { described_class.new(id: 12345678) }

      it "raises an ActiveResource::ResourceNotFound error" do
        expect { change_payment_profile }.to raise_error(ActiveResource::ResourceNotFound)
      end
    end

    context "when payment profile is not found" do
      let(:subscription) { described_class.find(76354749) }
      let(:payment_profile) do
        ChargifyWrapper::PaymentProfile.new({
          id: 12345678,
          subscription_id: subscription.id
        })
      end

      it "raises an ActiveResource::ResourceNotFound error" do
        expect { change_payment_profile }.to raise_error(ActiveResource::ResourceNotFound)
      end
    end
  end
end
