class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address.id), notice: "配送先を登録しました"
    else
      render index, alert: "配送先の登録に失敗しました"
    end
  end

  def update

  end

  def destroy

  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :customer_id)

  end
end
