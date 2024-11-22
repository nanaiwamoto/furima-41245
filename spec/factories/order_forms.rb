FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    shopping_region_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
