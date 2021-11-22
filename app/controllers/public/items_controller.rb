class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
