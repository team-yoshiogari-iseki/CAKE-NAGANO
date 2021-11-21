class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).blank?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path, notice: "カートに商品が追加されました"
    else
      render 'public/items/show'
    end
  end

  def update
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item.save
      redirect_to cart_items_path, notice: "カートに新たな商品が追加されました"
    else
      render 'public/items/show'
    end
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
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
