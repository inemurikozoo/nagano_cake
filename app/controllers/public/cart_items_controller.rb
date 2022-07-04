class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    bingding.pry
    @item = Item.find(cart_item_params[:item_id])
  end

  def destroy
    # @cart_item = CartItem.find([:id])
    # @cart_teim.destroy
    # redirect_to
  end

  def destroy_all
  # @cart_items = current_customer.cart_items
  # @cart_items.destroy_all
  # flash[:alert] = "カートの商品をすべて削除しました"
  # redirect_to customers_cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
