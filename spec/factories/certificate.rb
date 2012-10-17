# encoding: utf-8
# spec/factories/certificate.rb

FactoryGirl.define do
  factory :certificate do
    association :certifiable, factory: :student
    kind "event"
    event "Evento Genérico"
    course_code "COD 000"
    duration "X horas"
  end

  trait :event do
    kind "event"
    event "ITDAY 2012"
    course_code "ITDAY 2012"
    duration "10 horas"
  end

  trait :course do
    kind "course"
    course "Academia de Programação"
    course_code "DEV1 1256"
    duration "240 horas"
    start_date "Junho de 2012"
    end_date "Janeiro de 2013"
  end

  factory :event_lecturer_certificate, parent: :certificate, traits: [:event] do
    association :certifiable, factory: :lecturer
    lecture "Palestra Interessante"
  end

  factory :event_student_certificate, parent: :certificate, traits: [:event] do
    association :certifiable, factory: :student
  end

  factory :course_student_certificate, parent: :certificate, traits: [:course] do
    association :certifiable, factory: :student
  end

  factory :course_lecturer_certificate, parent: :certificate, traits: [:course] do
    association :certifiable, factory: :lecturer
  end
end
