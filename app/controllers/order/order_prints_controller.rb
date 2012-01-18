class Order::OrderPrintsController < ApplicationController
  def index
    @order_print_logs = OrderPrintLog.find_all_by_order_id params[:order_id]
  end

  def show
    @order = Order.find(params[:id])
    render :layout => false
  end

  def create
    @order_print_log =  OrderPrintLog.new :order_id => params[:order_id], :administrator_id => current_administrator

    if @order_print_log.save
      render :json => "success".to_json
    else
      render :json => "failure".to_json
    end
  end
end