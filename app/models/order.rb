class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_way: { card: 0, transfer: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * quantity
  end

end
