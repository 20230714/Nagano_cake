class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end

  
  private

   def customer_params
     params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postcode,:address,:phone_number,:email,:is_deleted)
   end
end
