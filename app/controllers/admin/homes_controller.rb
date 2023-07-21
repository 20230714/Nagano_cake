class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page]).per(10)
  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method,)
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :name)
  end



end
