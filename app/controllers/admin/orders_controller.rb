class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    #@order_details = OrderDetail.find(order_id: @order.id)
  end
end
