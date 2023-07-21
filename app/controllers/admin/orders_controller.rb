class Admin::OrdersController < ApplicationController


  def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
  @order = Order.find(params[:id])
  if @order.update(order_params)
     @order.order_details.update_all(making_status: 1) if @order.status == "入金確認"
  end
  redirect_to admin_order_path
  end


private
  def order_params
  params.require(:order).permit(:status)
  end

end
