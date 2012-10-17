require 'spec_helper'

describe Certificate do
  it "has a valid factory" do
    FactoryGirl.create(:certificate).should be_valid
  end

  it "should generate it's own uuid" do
    certificate = FactoryGirl.create(:certificate)
    certificate.uuid.should_not be_nil
  end

  it "should not be sent by default" do
    certificate = FactoryGirl.create(:certificate)
    certificate.sent.should be_false
  end

  # validations
  it "should require certifiable" do
     certificate = FactoryGirl.build(:certificate, certifiable: nil)
     certificate.save.should be_false
  end

  it "should require event" do
    certificate = FactoryGirl.build(:certificate, event: nil)
    certificate.save.should be_false
  end

  it "should require duration" do
    certificate = FactoryGirl.build(:certificate, duration: nil)
    certificate.save.should be_false
  end

  it "should require course_code" do
    certificate = FactoryGirl.build(:certificate, course_code: nil)
    certificate.save.should be_false
  end

  it "should require lecture only if certifiable is lecturer and kind is event" do
    certificate = FactoryGirl.build(:event_lecturer_certificate, lecture: nil)
    certificate.save.should be_false
    certificate = FactoryGirl.build(:event_student_certificate, lecture: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:course_lecturer_certificate, lecture: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:course_student_certificate, lecture: nil)
    certificate.save.should be_true
  end

  it "should require course only if kind is course" do
    certificate = FactoryGirl.build(:event_lecturer_certificate, course: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:event_student_certificate, course: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:course_lecturer_certificate, course: nil)
    certificate.save.should be_false
    certificate = FactoryGirl.build(:course_student_certificate, course: nil)
    certificate.save.should be_false
  end


  it "should require start_date only if kind is course" do
    certificate = FactoryGirl.build(:event_lecturer_certificate, start_date: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:event_student_certificate, start_date: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:course_lecturer_certificate, start_date: nil)
    certificate.save.should be_false
    certificate = FactoryGirl.build(:course_student_certificate, start_date: nil)
    certificate.save.should be_false
  end

  it "should require end_date only if kind is course" do
    certificate = FactoryGirl.build(:event_lecturer_certificate, end_date: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:event_student_certificate, end_date: nil)
    certificate.save.should be_true
    certificate = FactoryGirl.build(:course_lecturer_certificate, end_date: nil)
    certificate.save.should be_false
    certificate = FactoryGirl.build(:course_student_certificate, end_date: nil)
    certificate.save.should be_false
  end
end
