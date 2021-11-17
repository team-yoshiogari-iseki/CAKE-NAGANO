class Public::CartItemsController < ApplicationController

  def index
    @cart_items = Current_customer.cart_items.all
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path, notice: "カートに商品が追加されました"
    else

    end
  end

  def update
  end

  def destroy
    @cart_item = Cart_item(params[:id])
    @cart_item.destoy
    redirect_to cart_items_path, notice: "商品が削除されました"
  end

  def destroy_all
    current_customer.cart_items.destoy_all
    redirect_to items_path
  end

  private

  def cart_item_params
    params.permit(:item_id, :quantity)
  end

end
