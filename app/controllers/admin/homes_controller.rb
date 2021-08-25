class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    case params[:sort]
    when "1"
      customer_id = Rails.application.routes.recognize_path(request.referer)[:id]
      customer = Customer.find(customer_id)
      @orders=customer.orders.page(params[:page]).per(10)
    else
      @orders=Order.page(params[:page]).per(10)
    end
  end

end
