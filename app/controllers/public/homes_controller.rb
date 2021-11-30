class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).limit(4)
    @q = current_user.tasks.ransack(params[:q])
    @items = @q.result(distinct: true).recent
  end

  def about
  end

end
