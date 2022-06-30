class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.(params[:id])
  end
  
  def create
    
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
 
end
