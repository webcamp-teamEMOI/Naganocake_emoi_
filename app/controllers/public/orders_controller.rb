class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = current_customer.cart_items
  end

	def create
		customer = current_customer

		# sessionを使ってデータを一時保存
		session[:order] = Order.new

		cart_items = current_customer.cart_items

		# total_paymentのための計算
		sum = 0
		cart_items.each do |cart_item|
			sum += (cart_item.item.add_tax_price).floor * cart_item.amount
		end

		session[:order][:shipping_cost] = 800
		session[:order][:total_payment] = sum + session[:order][:shipping_cost]
		session[:order][:status] = 0
		session[:order][:customer_id] = current_customer.id
		# ラジオボタンで選択された支払方法のenum番号を渡している
		session[:order][:payment_method] = params[:payment_method].to_i

		# ラジオボタンで選択されたお届け先によって条件分岐
		destination = params[:a_method].to_i

		# ご自身の住所が選択された時
		if destination == 0

			session[:order][:postal_code] = customer.postal_code
			session[:order][:address] = customer.address
			session[:order][:name] = customer.last_name + customer.first_name

		# 登録済住所が選択された時
		elsif destination == 1

			address = Address.find(params[:address_for_order])
			session[:order][:postal_code] = address.postal_code.to_i
			session[:order][:address] = address.address
			session[:order][:name] = address.name

		# 新しいお届け先が選択された時
		elsif destination == 2

			session[:new_address] = 2
			session[:order][:postal_code] = params[:postal_code].to_i
			session[:order][:address] = params[:address]
			session[:order][:name] = params[:name]

		end

		# お届け先情報に漏れがあればリダイレクト
		if session[:order][:postal_code].presence && session[:order][:address].presence && session[:order][:name].presence
			redirect_to orders_confirm_path
		else
			redirect_to new_order_path
		end

	end

  def complete
		order = Order.new(session[:order])
		order.save
		# 新しいお届け先を自動で保存？
		if session[:new_address]
			address = current_customer.addresses.new
			address.postal_code = order.postal_code
			address.address = order.address
			address.name = order.name
			address.save
			session[:new_address] = nil
		end

		# 以下、order_detail(中間テーブル)作成
		cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
		order_detail = OrderDetail.new
		order_detail.order_id = order.id
		order_detail.item_id = cart_item.item.id
		order_detail.amount = cart_item.amount
		order_detail.making_status = 0
		order_detail.price = (cart_item.item.add_tax_price).floor
		order_detail.save
		end

		# 購入後はカート内商品削除
		cart_items.destroy_all
  end

  def index
  	@orders = current_customer.orders
  end

  def show
  	@order = Order.find(params[:id])
  end

end
