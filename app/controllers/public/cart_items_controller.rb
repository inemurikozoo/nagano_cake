class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    # @price = sub_total(@cart_item).to_s(:delimited)
    @cart_items = current_customer.cart_items
    # @total = total_price(@cart_items).to_s(:delimited)
    redirect_to cart_items_path, notice: 'カート内アイテムの数量を変更しました。'

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カート内のアイテムをすべて削除しました。'
  end

  #カートに商品を追加・保存
  def create
    if params[:cart_item][:amount] == ""
      redirect_to create
      flash[:alert] = "数量を入力してください"
    else
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
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end