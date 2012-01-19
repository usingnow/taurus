class Order::BackOrderNewsController < ApplicationController
  def new
    @user = User.find params[:user_id]
    BackOrderSku.destroy_all(:user_id => params[:user_id])
    @search = Sku.search(params[:q])
    @procedures = Procedure.user_procedures params[:user_id]
  end

  def create

  end
end
