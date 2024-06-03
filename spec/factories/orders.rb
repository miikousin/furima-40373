FactoryBot.define do
  factory :order do
    association :item
    association :user
    association :purchase

    post_code     { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    region_id     { Faker::Number.within(range: 2..48)}
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    tel           { Faker::Number.number(digits: [10, 11].sample) }
    
  end
end
