class Public::OrdersController < ApplicationController
before_action :authenticate_customer!

  def new
  @order = Order.new
  @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @total = 0
    if params[:order][:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name

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
    @order = Order.new(order_params)
    @order.save

    if params[:order][:ship] == "1"
      current_customer.address.create(address_params)
    end

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.quantity = cart_item.quantity
      @order_detail.price = cart_item.item.price * cart_item.quantity
      @order_detail.save
      end

    @cart_items.destroy_all

    redirect_to complete_orders_path
  end


  def index

  end

  def show

  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method)
  end

end
