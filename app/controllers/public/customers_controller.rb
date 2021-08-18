class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  
  
  def customer_params
   params.rewuire(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number)
  end  
  
  
end
