FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.sentence}
    explanation          {Faker::Lorem.sentence}
    price                {2}
    category_id          {2}
    condition_id         {2}
    delivery_fee_id      {2}
    shipment_source_id   {2}
    shipment_date_id     {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end