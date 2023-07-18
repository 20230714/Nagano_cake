class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
  @cart_items = current_customer.cart_items
  @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update

  end

  def destroy

  end

  def all_destroy

  end

  def create
  @cart_item = CartItem.new(cart_items_params)

  end

private
  def cart_items_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
