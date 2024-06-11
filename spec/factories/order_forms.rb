FactoryBot.define do
  factory :order_form do
    post_code     { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    region_id     { Faker::Number.within(range: 2..48)}
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    tel           { Faker::Number.leading_zero_number(digits: [10, 11].sample) }
    token         { Faker::Internet.password(min_length: 20, max_length: 30) }    
  end
end