class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(
      customer: current_customer,
      pay_type: params[:order][:pay_type])
  end
  
end
