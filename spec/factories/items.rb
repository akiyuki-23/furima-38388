FactoryBot.define do
  factory :item do
    item_name                  { Faker::Commerce.product_name }
    item_info                  { Faker::Lorem.sentences }
    category_id                { 2 }
    sales_status_id            { 2 }
    shipping_fee_status_id     { 2 }
    prefecture_id              { 2 }
    item_scheduled_delivery_id { 2 }
    item_price                 { 10_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
