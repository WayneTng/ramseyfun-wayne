FactoryGirl.define do
  factory :fan do
    name 'Steven'
    email 'Steven@example.com'
    password '12345678'

    after(:create) { |fan| fan.confirm! }
  end
end
