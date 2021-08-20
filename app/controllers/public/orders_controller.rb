class Public::OrdersController < ApplicationController
<<<<<<< HEAD
  
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
=======
  def comfirm
  end
>>>>>>> 7d614d156eedac79d6997e6a41028011a55a833f
end
