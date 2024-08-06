FactoryBot.define do
  factory :order_payment do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    block { '渋谷2-3' }
    phone_number { '1234567890' }
    user_id { 1 }
    item_id { 1 }
  end
end
