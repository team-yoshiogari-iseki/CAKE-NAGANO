class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.all.page(params[:page])
    @order = Order.find(params[:id])
    @order_datails= OrderDetail.find(@order.id == order_id)
    @total_quantity = @order_datails.inject(0) { |sum, item| sum + quantity }
  end
  
end
