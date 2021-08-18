class Admin::CustomersController < ApplicationController

  def index
    @customers=Customer.page(params[:page]).per(10)
  end

  def show
    @customer=Costomer.find(params[:id])
  end

  def update
    customer=Costomer.find(params[:id])
    if customer.update(customer_params)
      redirect_to request.referer
    else
      redirect_to request.referer,notice:"更新できませんでした"
    end
  end

  protected

  def customer_params
    params.require(:customer).permit(:is_deleted)
  end

end
