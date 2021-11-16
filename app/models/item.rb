class Item < ApplicationRecord
  
  attachment :image, destroy: false
  
  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :is_status, presence: true
  
end
