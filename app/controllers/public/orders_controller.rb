class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

  def complete
  end

  def index
  end

  def show
  end
  
end
