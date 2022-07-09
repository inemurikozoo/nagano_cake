class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to customer_path
      else
        render :edit and return
      end
  end
  
  def quit
    @customer = current_customer
  end

  def exit
    
  end
  
  private

  def customer_params
    params.require(:customer)
    .permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
