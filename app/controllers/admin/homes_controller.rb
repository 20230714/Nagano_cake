class Admin::HomesController < ApplicationController

  def top
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method,)
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :name)
  end



end
