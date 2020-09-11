require 'spec_helper'

RSpec.describe SimpleConstants do
  it "has a version number" do
    expect(SimpleConstants::VERSION).not_to be nil
  end
end
