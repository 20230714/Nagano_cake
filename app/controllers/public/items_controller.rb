class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @genres = Genre.all
  if params[:genre_id]
  	@genre = Genre.find(params[:genre_id])
  	@items = @genre.items.page(params[:page]).per(8)
  else
  	@items = Item.all.page(params[:page]).per(8)
  end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
