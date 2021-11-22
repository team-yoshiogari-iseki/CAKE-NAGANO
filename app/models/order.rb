class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum order_status: { waiting_for_deposit:0, payment_confirmation:1, production:2, ready_to_ship:3, shipped:4}

  enum payment_way: { card: 0, transfer: 1 }

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * quantity
  end

end
