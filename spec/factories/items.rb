FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    description       { Faker::Lorem.sentence }
    category_id       { 2 }
    condition_id      { 2 }
    shopping_cost_id  { 2 }
    shopping_region_id { 2 }
    shopping_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: StringIO.new('dummy image'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
