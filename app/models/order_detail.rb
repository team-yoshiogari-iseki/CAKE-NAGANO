class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { not_startable:0, waiting_for_production:1, production:2, production_completed:3}
  

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    price * quantity
  end

  #def @order.claimed
  # (@total + @postage)
  #end

end
