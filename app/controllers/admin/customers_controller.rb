class Admin::CustomersController < ApplicationController
  
  def index
    #publicで作成したら＃外す。（しばじゅん）
    #@customers = Cutomer.all
  end
  
  def show
    #publicで作成したら＃外す。（しばじゅん）
    #@customer = Customer.find(params[:id])
  end
  
  def edit
    #publicで作成したら＃外す。（しばじゅん）
    #@customer = Customer.find(params[:id])
  end
  
  def update
    #publicで作成したら＃外す。（しばじゅん）
    #@customer = Customer.find(params[:id])
    #if @customer.update(customer_params)
       #flash[:notice] = "会員情報を更新しました。"
       #redirect_to request.referer
    #else
      #render "edit"
    #end
  end
  
  private
  
   def customer_params
     params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postcode,:address,:phone_number,:email,:is_deleted)
   end
end
