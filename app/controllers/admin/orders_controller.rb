class Admin::OrdersController < ApplicationController

  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @genres = Genre.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      payment_comfirm?(@order)
      redirect_to admin_path(@order.id), notice: "注文ステータスを更新しました"
    else
      render :show, alert: "注文ステータスを更新できませんでした"
    end
  end

 # 注文ステータスが「入金確認」になったとき、製作ステータスをすべて「製作待ち」にする
  def payment_comfirm?(order)
    if order.status == "payment_comfirm"
      order.order_items.each do |order_item|
        order_item.update(status: "waiting")
      end
      flash[:notice] = "製作ステータスが「製作待ち」に更新されました"
    end
  end

  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end


end
