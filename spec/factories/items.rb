FactoryBot.define do
  factory :item do
    title { "タイトル" }
    description { "商品説明" }
    category_id { 2 }
    item_state_id { 2 }
    delivery_price_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/IMG_0030.JPG'), filename: 'IMG_0030.JPG')
    end
  end
end
