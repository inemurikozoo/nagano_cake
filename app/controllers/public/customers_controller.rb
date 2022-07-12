class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
      if @customer.update(customer_params)
        redirect_to customers_path
      else
        render :edit and return
      end
  end

  def quit
    @customer = current_customer
  end

  def exit
    @customer = current_customer
    @customer.is_active = false
    @customer.update
    reset_session
    flash[:notice] = "退会処理が完了しました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer)
    .permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
