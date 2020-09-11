require 'spec_helper'

describe SimpleConstants::Status do
  it "ALL returns correct array of statuses" do
    aggregate_failures do
      expect(SimpleConstants::Status::ALL.is_a?(Array)).to be_truthy
      expect(SimpleConstants::Status::ALL.map(&:code_str)).to eq(%w[draft published deleted])
    end
  end
end
