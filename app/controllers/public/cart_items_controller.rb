class Public::CartItemsController < ApplicationController

  def index
    @cart_items = Cart_items.all
  end

  def create
    @item = @cart_item
    @cart_item = Cart_item.new(cart_item_params)
    if @cart_item.save
      redirect_to item_path(@item.id), notice: "カートに商品が追加されました"
    end
  end

  def update
  end

  def destroy
  end

  private

  def cart_item_params
    params.permit(:item_id, :quantity)
  end

end
