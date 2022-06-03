class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end  

#エラーがないことを確認したら、ストロングパラメータを記述する
end