# frozen_string_literal: true

require "spec_helper"

RSpec.describe ChargifyWrapper::Coupon do
  describe "#validate", :vcr do
    subject(:validate_coupon) { described_class.validate(coupon) }

    context "when coupon is existent and valid" do
      let(:coupon) { "GENERALCOUPON" }

      it { expect(validate_coupon).to be_present }
    end

    context "when coupon is not existent" do
      let(:coupon) { "ANYCOUPON" }

      it { expect { validate_coupon }.to raise_error(ActiveResource::ResourceNotFound) }
    end

    context "when coupon is existent but not valid" do
      let(:coupon) { "25RDJMSNET" }

      it { expect { validate_coupon }.to raise_error(ActiveResource::ResourceNotFound) }
    end
  end
end
