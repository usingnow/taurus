#encoding:UTF-8
class Order::BackOrderSkusController < ApplicationController
  def index
    @search = Sku.search(params[:q])
    @search.sorts = 'updated_at desc'
    @skus = @search.result.paginate(:page => params[:page],:per_page => 20)
  end

  def show
    @inner_sku_carts = BackOrderSkusController.find_all_by_user_id(session[:cart_id])
  end

  def update
    @back_order_sku = BackOrderSku.find(params[:id])
    @back_order_sku.update_attributes :quantity => params[:value]
  end

  def create
    if params[:user_id].blank?
      @error = "请先选择会员！"
      @back_order_skus = Array.new
    else
      @back_order_sku = BackOrderSku.new :user_id => params[:user_id], :sku_id => params[:sku_id]
      @back_order_sku.save

      @back_order_skus = BackOrderSku.find_all_by_user_id(params[:user_id])
    end
  end

  def destroy
    @back_order_sku = BackOrderSku.find(params[:id])
    @back_order_sku.destroy

    @back_order_sku_id = params[:id]
  end
end