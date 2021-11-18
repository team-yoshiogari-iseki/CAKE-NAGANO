class Item < ApplicationRecord
  
  attachment :image, destroy: false
  
  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :is_status, presence: true
  
  def with_tax_price
    (price * 1.1).floor
  end
end
