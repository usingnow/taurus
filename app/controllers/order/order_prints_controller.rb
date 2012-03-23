class Order::OrderPrintsController < ApplicationController
  def index
    authorize! :print, Order
    @order_print_logs = OrderPrintLog.find_all_by_order_id_and_line_type params[:order_id], params[:line_type]
  end

  def show
    authorize! :print, Order
    @order = Order.find(params[:id])
    render :layout => false
  end

  def create
    @order_print_log =  OrderPrintLog.new :order_id => params[:order_id], :administrator_id => current_administrator, :line_type => params[:line_type]

    if @order_print_log.save
      render :json => "success".to_json
    else
      render :json => "failure".to_json
    end
  end
end