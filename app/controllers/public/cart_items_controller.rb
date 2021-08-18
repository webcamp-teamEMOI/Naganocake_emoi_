class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @cart_item = Cart_item.new(cart_item_params)
      @genres = Genre.all
      @item = Item.find_by(id:@cart_item.item_id)
      redirect_to item_path(@item.id), flash: {alert: '※個数を選択して下さい'}
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
