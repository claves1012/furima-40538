class OrderPayment
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token, :user_id, :item_id
  
  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Input in the format '3-digits-4-digits'."}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :user_id
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input a 10 to 11 digit number."}
  end
  validates :building, presence: false

  def save
    ActiveRecord::Base.transaction do
      order = Order.create!(user_id: user_id, item_id: item_id)
      Payment.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
    end
  rescue ActiveRecord::RecordInvalid => e
    false
  end
end