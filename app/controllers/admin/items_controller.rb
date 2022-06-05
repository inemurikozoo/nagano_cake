class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end  

#エラーがないことを確認したら、ストロングパラメータを記述する
end