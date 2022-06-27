class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.all
  end

  def complete
  end

  def index
  end

  def show
  end
  
  def  
    
  end
end
