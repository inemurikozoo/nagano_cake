class Admin::ProductDetailsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_items_params)
      redirect_to admin_path(@order.id)
    else
      render 'orders/show'
    end
  end
  
  private
  
  def order_items_params
    params.require(:order_item).permit(:status)
  end
end
