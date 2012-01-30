class Admin::OrderDetailsController < ApplicationController
  before_filter :authenticate_administrator!

  def create
    sku_id = params[:sku_id]
    order_id = params[:order_id]
    sku = Sku.find(sku_id)
    admin_id = current_administrator.id
    @order_detail = OrderDetail.find_by_sku_id_and_order_id(sku_id,order_id)
    if @order_detail.nil?
      @order_detail = OrderDetail.new(:order_id => order_id, :sku_id => sku_id, :unit_price => sku.cost_aft_tax,
                                      :created_admin_id => admin_id, :updated_admin_id => admin_id)
    else
      @order_detail.quantity+=1
    end
    @order_detail.save

    @order_details = OrderDetail.find_all_by_order_id(order_id)
  end

  def update
    value = params[:value]

    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update_attributes(:quantity => value)
    @order_details = OrderDetail.find_all_by_order_id(params[:order_id])
  end

  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy

    @order_details = OrderDetail.find_all_by_order_id(@order_detail.order_id)
  end
end