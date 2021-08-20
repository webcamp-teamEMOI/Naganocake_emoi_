class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(1)
  end

  def comfirm
  end
end
