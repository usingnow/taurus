#encoding:UTF-8
class Order::OrderPrintsController < ApplicationController
  def index
    authorize! :print, Order
    @order_print_logs = OrderPrintLog.find_all_by_order_id_and_line_type params[:order_id], params[:line_type]
  end

  def show
    authorize! :print, Order
    @order = Order.find(params[:id])
    pdf = Prawn::Document.new(:page_size => [595,397], :page_layout => :portrait)
    pdf.font "#{::Prawn::BASEDIR}/data/fonts/SimHei.ttf"

    page = (@order.order_details.size-1)/10+1

    page.times.each do |p|
      pdf.draw_text "壹美壹家购物订单", :size => 20, :at => [220,330]
      pdf.image "app/assets/images/printLogo.jpg",:width => 40, :height => 40, :at => [0,350]
      pdf.draw_text "轻松办公    快乐生活", :size => 10, :at => [50,316]

      pdf.move_down 20
      pdf.table([["订单编号：", @order.number, "订单批次：", @order.batch, "下单时间：", @order.created_at.to_s, "制单人：", @order.make_by],
                 ["订单类型：", Sku::SKU_TYPE[@order.order_details.last.sku.sku_type],"订单状态：", @order.instance.station.name,
                  "客户：", @order.user.name]], :cell_style => {:size => 8, :border_width => 0}, :column_widths => {})

      data = [["#","商品编号","商品名称","素材编号","单位", "规格型号","单价","数量","安装费"	,"组装费","小计"]]
      i = 0
      @order.order_details.limit(10).offset(p*10).each_with_index do |item,index|
        data << [index + 1 + p*10, item.sku.number, item.sku.name, item.sku.products.last.product_id, item.sku.unit,
                 item.sku.specification+","+item.sku.model, item.promotion_unit_price, item.quantity, item.promotion_installation_cost,
                 item.promotion_assembling_fee, item.promotion_subtotal]
        i = index
      end

      (9-i).times.each do
        data << ["","","","","","","","","","",""]
      end

      pdf.table(data,:cell_style => {:size => 6 }, :column_widths => [20,35,170,35,25,110,30,25,30,30,40])
      pdf.table([["其他费用：#{@order.other_cost}  运费：#{@order.promotion_carriage_adjustment}  合计金额：#{@order.promotion_price}"]],
                :cell_style => {:size => 6, :align => :right }, :width => 550)

      pdf.bounding_box([0, 0], :width => 595, :height => 150) do

        pdf.table([["www.emehome.cn", "客服热线：400-630-5006", "宁波壹美壹家贸易有限公司", "页码：#{p+1}/#{page}"]],
                :cell_style => {:size => 8, :border_width => 0}, :column_widths => {0 => 135, 1 => 135, 2 => 135, 3 => 135})
      end

      pdf.start_new_page if (p+1) < page
    end



    number = @order.number
    FileUtils.makedirs "public/print_file/order/#{number}"

    pdf.render_file "public/print_file/order/#{number}/#{Time.now.strftime("%Y%m%d%H%M%S")}.pdf"
    send_data pdf.render, type: "application/pdf", disposition: "inline"
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