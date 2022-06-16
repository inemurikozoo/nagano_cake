class Admin::ProductDetailsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to admin_path(@order), notice: "製作ステータスを更新しました"
    else
      render 'orders/show', alert: "製作ステータスを更新できませんでした"
    end
  end
  
  private
  
  def order_item_params
    params.require(:order_item).permit(:status)
  end
end
