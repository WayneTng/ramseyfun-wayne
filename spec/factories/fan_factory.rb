FactoryGirl.define do
  factory :fan do
    name 'Steven'
    sequence(:email) { |n| "Iker-#{n}@example.com"}
    password '12345678'

    after(:create) { |fan| fan.confirm! }
  end
end
