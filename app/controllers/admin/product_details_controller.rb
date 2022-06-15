class Admin::ProductDetailsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_path(@order.id)
    else
      render :show
    end
  end
end
