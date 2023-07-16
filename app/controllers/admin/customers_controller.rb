class Admin::CustomersController < ApplicationController
  
  def index
    #publicで作成したら＃外す。（しばじゅん）
    #@customers = Cutomer.all
  end
  
  def show
    #@customer = Customer.find(params[:id])
  end
  
  def edit
  end
end
