class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    if params[:word]
      @items = Item.looks(params[:word]).page(params[:page])
    else
      @items = Item.all.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
      @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :is_sold_out)
  end
end
