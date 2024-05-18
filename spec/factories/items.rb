FactoryBot.define do
  factory :item do
    name               { Faker::Commerce.product_name }
    price              { Faker::Number.within(range: 300..9999999) }
    items_description  { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 2..11)}
    postage_id         { Faker::Number.within(range: 2..3)}
    condition_id       { Faker::Number.within(range: 2..7)}
    region_id          { Faker::Number.within(range: 2..48)}
    number_of_day_id   { Faker::Number.within(range: 2..4)}
  end
end
