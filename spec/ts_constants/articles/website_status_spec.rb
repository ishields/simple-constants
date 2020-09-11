require 'spec_helper'

describe SimpleConstants::Articles::WebsiteStatus do
  it "ALL returns array of website statuses" do
    expect(SimpleConstants::Articles::WebsiteStatus::ALL.is_a?(Array)).to be_truthy
  end
end
