class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @genre = Genre.all
    if 
      @order_items = Order
    else
      @order_items = OrderItem.all
    end
  end
end
