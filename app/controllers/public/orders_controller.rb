class Public::OrdersController < ApplicationController

  def new

  end

  def confirm

  end

  def complete

  end

  def create

  end

  def index

  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method)
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :name)
  end

end
