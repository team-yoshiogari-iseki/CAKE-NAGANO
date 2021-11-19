class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.payment_way = params[:order][:payment_way]

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.order_address = current_customer.address

    elsif params[:order][:address_option] == "1"
      @order.order_address = params[:order][:order_address].to_i
      @order_address = Address.find
      @order.postal_code = @order_address.postal_code
      @order.order_address = @order_address.address
      @order.orderer_name = @order_address.orderer_name

    elsif params[order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.order_address = params[:order][:order_address]
    end
  end

  def index
  end

  def show
  end

  def create
  end

  def success
  end

  private

  def order_params
    params.require(:order).permit(:orderer_name, :postal_code, :address)
  end

end
