class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_path(@order.id)
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end
