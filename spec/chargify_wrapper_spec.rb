# frozen_string_literal: true

require "spec_helper"

RSpec.describe ChargifyWrapper do
  it "has a version number" do
    expect(ChargifyWrapper::VERSION).to eql("0.4.0")
  end
end
