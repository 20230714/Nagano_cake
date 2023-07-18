class Public::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
  
  def top
    @genres = Genre.all
    @items = Item.all.last(4)
  end
end
