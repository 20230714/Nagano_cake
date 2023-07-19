class Public::OrdersController < ApplicationController
before_action :authenticate_customer!

  def new
  @order = Order.new
  @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
        ship = Address.find(params[:order][:customer_id])
        @order.postcode = ship.post_code
        @order.address = ship.address
        @order.name = ship.name

    elsif params[:order][:address_option] = "2"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
        render 'new'
    end

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
