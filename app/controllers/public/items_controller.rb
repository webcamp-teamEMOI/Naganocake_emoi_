class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).reverse_order
    @genres = Genre.all
  end

end
