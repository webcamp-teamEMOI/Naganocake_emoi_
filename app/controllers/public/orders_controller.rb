class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
    # @customer = current_customer
    # @customer = Customer.find(params[:current_customer])
  end

  def comfirm
    @order = Order.new.params(order_params)

  end

  private

  def order_params
    params.require(:order).permit(:shipping_cost, :total_payment, :payment_method, :name, :address, :postal_code, :status)
  end
end
