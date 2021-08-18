class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id) #idがないって出る  
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :prace, :is_active)
    end

end
