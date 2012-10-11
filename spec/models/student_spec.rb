require 'spec_helper'

describe Student do
  it "has a valid factory" do
    FactoryGirl.create(:student).should be_valid
  end
end
