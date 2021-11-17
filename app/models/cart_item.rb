class CartItem < ApplicationRecord

  belongs_to :customer, dependent: :destroy
  has_many :items

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * quantity
  end
end
