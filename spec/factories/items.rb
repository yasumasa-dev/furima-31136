FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.sentence}
    explanation          {Faker::Lorem.sentence}
    price                {"1000"}
    category_id          {"メンズ"}
    condition_id         {"新品、未使用"}
    delivery_fee_id      {"着払い(購入者負担)"}
    shipment_source_id   {"東京都"}
    shipment_date_id     {"1~2日で発送"}
    image                {"test_image.png"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end