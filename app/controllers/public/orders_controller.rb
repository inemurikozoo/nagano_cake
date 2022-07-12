class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.pay_type = params[:order][:pay_type]
    @order.postage = 800
    @order.payment_amount = current_customer.cart_items.cart_items_total_price(@cart_items)
    
    #お届け先の情報によって処理の条件分岐
    #current_customerの住所
    if params[:order][:addresses] == "my_addresses"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name + current_customer.first_name
      render 'confirm'
    #current_customerの登録住所
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name
      render 'confirm'
      
    #新しいお届け先
    elsif params[:order][:addresses] == "new_addresses"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @ship = "new"
      
    else
      render 'new'
    end
end
  
  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save!
      #cart_itemの内容をorder_itemに移す
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_item = OrderItem.new(order_id: @order.id)
        order_item.item_id = cart_item.item_id
        order_item.price = cart_item.item.price
        order_item.amount = cart_item.amount
        order_item.save!
      end
      
      flash[:notice] = "ご注文が確定しました。"
      #current_customerのカートを
      @cart_items.destroy_all
      redirect_to order_complete_path
      
   #新しいお届け先を選んでいた場合、Addressモデルに登録する
    if params[:order][:ship] == "new"
      current_customer.address.create(address_params)
    end
    
  #カート商品の情報を注文商品に移動する
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      OrderItem.create(
        item: cart_item.item,
        order: @order,
        amount: cart_item.amount,
        price: sub_total(cart_item)
        )
      end
    #カートを空にする
    @cart_items.destroy_all
    end
  end
  def index
    @orders = current_customer.orders
    
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :pay_type, :payment_amount)
  end

  def address_params
    params.require(:address).permit(:customer_id,:postal_code, :name, :address)
  end
end
