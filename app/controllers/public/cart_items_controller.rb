class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
    @cart_item.update(cart_item_params)
  end

  #カートに商品を追加・保存
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    #カートに同じ商品が存在するかを同じidが存在するかどうかで判断
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    #カートに同じ商品(item_idが存在する場合
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path, notice: 'すでにカートにある商品の数量を追加しました'
    elsif #もしカートに同じ商品がない場合
      @cart_item.save
      redirect_to cart_items_path, notice: 'カートに商品を追加しました'
    else #保存に失敗した場合
      render 'index', alert: 'カートに商品を追加できませんでした'
    end
  end

  def destroy
    @cart_item = CartItem.find([:id])
    @cart_item.destroy
    redirect_to
  end

  def destroy_all
  @cart_items = current_customer.cart_items
  @cart_items.destroy_all
  flash[:alert] = "カートの商品をすべて削除しました"
  redirect_to customers_cart_items_path
  end


  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
