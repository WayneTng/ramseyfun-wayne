FactoryGirl.define do
  factory :fan do
    name 'Steven'
    sequence(:email) { |n| "Iker-#{n}@example.com"}
    password '12345678'

    after(:create) { |fan| fan.confirm! }

    trait :with_dishes do
      after(:create) do |fan|
        create_list(:dish, 2, fan: fan)
      end
    end
  end
end
