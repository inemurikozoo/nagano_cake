class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.find([:id])
  end

  def edit
  end
end
