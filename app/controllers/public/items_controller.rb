class Public::ItemsController < ApplicationController
  def index
    @genre = Genre.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @genre = Genre.all
    @item = Item.find(params[:id])
  end
end
