class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all.inclues(:orders)
    @orders = Order.all.inclues(:order_items)
  end
end
