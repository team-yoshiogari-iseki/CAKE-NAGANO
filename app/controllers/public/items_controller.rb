class Public::ItemsController < ApplicationController

  def index
    @items = Item.all

  end

  def show
    @item = Item.find(params[1])

  end
end
