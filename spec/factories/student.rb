# spec/factories/student.rb
require 'faker'

FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    email  { Faker::Internet.email name=name }
    phone1 { Faker::PhoneNumber.phone_number }
    cpf "387.851.975-30" #random valid
    rg "403289440" #random valid
  end
  factory :real, class: Student do
    name "Derpino Herp Merp"
    email  "derpinomerp@gmail.com"
  end
end