FactoryBot.define do
  factory :order_payment do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    block { '渋谷2-3' }
    building { '渋谷ビル' }
    phone_number { '1234567890' }
  end
end
