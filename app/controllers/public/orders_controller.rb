class Public::OrdersController < ApplicationController
  
  def index
    @orders = current_customer.orders
  end
  
  def show
  end  
  
  private
  def order_params
    params.require(:order).permit(:customer_id,:shipping_cost,:total_payment,
    :payment_method,:name,:address,:postal_code,:status)
  end  
end
