class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_path(@order.id),　notice: "注文ステータスを更新しました"
    else
      render :show, alert: "注文ステータスを更新できませんでした"
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end
