require 'spec_helper'

describe Lecturer do
  it "has a valid factory" do
    FactoryGirl.create(:lecturer).should be_valid
  end
end
