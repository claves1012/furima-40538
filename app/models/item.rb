class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, presence:true
  validates :name, presence:true
  validates :description, presence:true
  validates :category_id, presence:true
  validates :item_status_id, presence:true
  validates :shipping_cost_id, presence:true
  validates :pretecture_id, presence:true
  validates :shipping_date_id, presence:true
  validates :price, presence:true
end
