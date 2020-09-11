require 'spec_helper'

describe SimpleConstants::Articles::Status do
  it "ALL returns correct array of statuses" do
    aggregate_failures do
      expect(SimpleConstants::Articles::Status::ALL.is_a?(Array)).to be_truthy
      expect(SimpleConstants::Articles::Status::ALL.map(&:code_str)).to eq(%w[draft published auto withdrawn training])
    end
  end
end
