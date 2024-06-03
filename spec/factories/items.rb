FactoryBot.define do
  factory :item do
    association :user
    # purchaseとorderはitemが作成された後に作成されるので、ここでは関連づけを行わない
    
    name               { Faker::Commerce.product_name }
    price              { Faker::Number.within(range: 300..9999999) }
    items_description  { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 2..11)}
    postage_id         { Faker::Number.within(range: 2..3)}
    condition_id       { Faker::Number.within(range: 2..7)}
    region_id          { Faker::Number.within(range: 2..48)}
    number_of_day_id   { Faker::Number.within(range: 2..4)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
