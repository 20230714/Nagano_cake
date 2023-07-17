class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  
  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end
end
