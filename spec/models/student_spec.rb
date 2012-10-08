require 'spec_helper'

describe Student do
  it "has a valid factory" do
    FactoryGirl.create(:student).should be_valid
  end
  it "creates its own certificate" do
    student = FactoryGirl.create(:student)
    student.create_certificate("Test Event")
    student.certificates.count.should eq(1)
  end
end
