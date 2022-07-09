class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer: current_customer)
  end

def confirm
    @cart_items = current_customer.cart_items
    
    @order = Order.new(
      #current_customerの情報と支払方法の情報を渡す
      customer: current_customer,
      pay_type: params[:order][:pay_type]
      )
  
    @order.payment_amount = view_context.billing(@order)
    
    #お届け先の情報によって処理の条件分岐
    #current_customerの住所
    if params[:order][:addresses] == "my_address"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name + current_customer.first_name
      
    #current_customerの登録住所
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name
      
    #新しいお届け先
    elsif params[:order][:addresses] == "new_addresses"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @ship = "new"
      
      #バリデーションエラーメッセージの表示
      unless @order.valid? == true
        @shipping_addresses = Address.where(customer: current_customer)
        render :new
      end
    end
end
  
  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が完了しました。"
    redirect_to order_complete_path
    
    #新しいお届け先を選んでいた場合、Addressモデルに登録する
    if params[:order][:ship] == "new"
      current_customer.address.create(address_params)
    end
    
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderItem.create(
        item: cart_item.item,
        order: @order,
        amount: cart_item.amount,
        price: sub_total(cart_item)
        )
    end
    #注文が確定したらカートを空にする
    @cart_items.destroy_all
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

end
