class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  
  attachment :image, destroy: false
  
  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validate :is_status
  
  def with_tax_price
    (price * 1.1).floor
  end
end
