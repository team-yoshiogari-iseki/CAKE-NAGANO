class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.payment_way = params[:order][:payment_way]
    @order.postage = 800
    @order.claimed = @total += @order.postage

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @order.postal_code = Address.find(params[:order][:registered]).postal_code
      @order.address = Address.find(params[:order][:registered]).address
      @order.name = Address.find(params[:order][:registered]).name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:orderer_name]
    end
  end

  def create
    cart_items = current_customer.CartItem.all
    @order = current_customer.Order.new(order_params)
    @order.save
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.quantity = cart_item.quantity
      OrderDetail.save
    end
    redirect_to orders_success_path, notice: "注文を受け付けました"
  end

  def success
  end

  def index
    @orders = current_customer.Order.all
  end

  def show
    @order_detail = current_customer.OrderDetail.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:orderer_name, :postal_code, :address)
  end

  def address_params
    params.require(:order).permit(:name, :postal_code, :address)
  end

end
