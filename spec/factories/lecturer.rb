# spec/factories/lecturer.rb
require 'faker'

FactoryGirl.define do
  factory :lecturer do
    name { Faker::Name.name }
    email  { Faker::Internet.email name=name }
    phone { Faker::PhoneNumber.phone_number }
  end
  factory :real_lecturer, class: Lecturer do
    name "Derpino Herp Merp"
    email  "derpinomerp@gmail.com"
  end
end

