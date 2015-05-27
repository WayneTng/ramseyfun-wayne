FactoryGirl.define do
  factory :dish do
    title       'chicken rice'
    description '1 whole chicken, pandan leave'
    cost        30
    pax         2
    vegetarian  false
    published   true

    association :fan 
  end
end
