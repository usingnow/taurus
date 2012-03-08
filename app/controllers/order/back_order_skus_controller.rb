#encoding:UTF-8
class Order::BackOrderSkusController < ApplicationController
  def index
    @search = Sku.begin_sales.search(params[:q])
    @search.sorts = 'updated_at desc'
    @skus = @search.result.paginate(:page => params[:page],:per_page => 20)
  end

  def show
    @inner_sku_carts = BackOrderSkusController.find_all_by_user_id(session[:cart_id])
  end

  def update
    @back_order_sku = BackOrderSku.find(params[:id])
    @back_order_sku.update_attributes :quantity => params[:value]
    @back_order_skus = BackOrderSku.find_all_by_user_id(@back_order_sku.user_id)
  end

  def create
    @back_order_sku = BackOrderSku.find_by_sku_id_and_user_id(params[:sku_id], params[:user_id])
    if @back_order_sku.nil?
      @back_order_sku = BackOrderSku.new :user_id => params[:user_id], :sku_id => params[:sku_id]
    else
      @back_order_sku.quantity += 1
    end
      @back_order_sku.save

      @back_order_skus = BackOrderSku.find_all_by_user_id(params[:user_id])
  end

  def destroy
    @back_order_sku = BackOrderSku.find(params[:id])
    @back_order_sku.destroy
    @back_order_skus = BackOrderSku.find_all_by_user_id(@back_order_sku.user_id)
  end
end