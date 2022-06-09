class Admin::ItemsController < ApplicationController
before_action :set_genres, only: [:new,:create,:edit,:update]


  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path(@item.id)
  end

  def update
    @item = Item.find(params[:id])
    @item.update
    redirect_to admin_items_path(@item.id)
  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

  def set_genres
    @genres = Genre.all
  end
end