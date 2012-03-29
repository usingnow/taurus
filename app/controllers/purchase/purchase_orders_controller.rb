#encoding:UTF-8
class Purchase::PurchaseOrdersController < ApplicationController
  before_filter :authenticate_administrator!
  #authorize_resource

  def index
    @search = PurchaseOrder.search(params[:q])
    @search.sorts = "created_at desc"
    @purchase_orders = @search.result.paginate(:page => params[:page], :per_page => 15)
  end


  def show
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def new
    @purchase_order = PurchaseOrder.new

    @cart = current_cart

    @search = Product.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @purchase_order = PurchaseOrder.new params[:purchase_order]
    @purchase_order.po_id = current_number("EME")
    @purchase_order.administrator_id = current_administrator.id
    @purchase_order.po_status = 0
    @purchase_order.po_store_status = false
    current_cart.po_product_temp_lists.each do |temp|
      @purchase_order.po_product_lists << PoProductList.new(:product_id => temp.product_id,
                                                            :product_purchase_amount => temp.product_purchase_amount,
                                                            :product_unit_price => temp.product.cost_aft_tax)
    end
    if @purchase_order.save
      current_cart.destroy
      session[:cart_id] = nil
      redirect_to purchase_purchase_orders_url
    else
      @cart = current_cart
      @search = Product.search(params[:q])
      @products = @search.result.paginate(:page => params[:page], :per_page => 10)
      render "new"
    end
  end

  def edit
    @purchase_order = PurchaseOrder.find(params[:id])

    @search = Product.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def update
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.update_attributes(params[:purchase_order])
    redirect_to purchase_purchase_orders_url
  end

  def released_edit
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def released_update
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.update_attributes(params[:purchase_order])
    redirect_to purchase_purchase_orders_url
  end


  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.update_attributes(:po_status => 2, :po_closed_at => Time.now)
    redirect_to purchase_purchase_orders_url
  end

  def search_products
    @search = Product.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def search_products_edit
    @search = Product.search(params[:q])
    @products = @search.result.paginate(:page => params[:page], :per_page => 10)
    @purchase_order = PurchaseOrder.find(params[:purchase_order_id])
  end

  def preview
    @purchase_order = PurchaseOrder.new params[:purchase_order]
    @cart = current_cart
    if @purchase_order.valid?
      render "preview"
    else
      @search = Product.search(params[:q])
      @products = @search.result.paginate(:page => params[:page], :per_page => 10)
      render "new"
    end
  end

  def check_supplier_id
    @supplier = Supplier.find_by_supplier_id params[:supplier_id]
    render :json => @supplier.to_json
  end

  def release
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.update_attributes(:po_status => 1, :po_released_at => Time.now)
    redirect_to purchase_purchase_orders_url
  end

  def print
    @purchase_order = PurchaseOrder.find(params[:id])
    pdf = Prawn::Document.new(:page_size => 'A4')
    pdf.font "#{::Prawn::BASEDIR}/data/fonts/SimHei.ttf"
    pdf.text "壹美壹家采购订单", :align => :center, :size => 20

    pdf.table([["订单编号：",@purchase_order.po_id,"供应商编号：",@purchase_order.supplier.supplier_id],
               ["订单日期：",@purchase_order.created_at.to_s,"供方电话：",@purchase_order.supplier.contact_way],
               ["订货公司：",@purchase_order.ordering_company.name,"供方传真：",@purchase_order.supplier.fax],
               ["订货地址：",@purchase_order.ordering_company.address,"供应公司：",@purchase_order.supplier.name],
               ["订方电话：",@purchase_order.ordering_company.phone]],:cell_style => {:size => 10, :border_width => 0},
               :column_widths => {1 => 200})

    data = [["#","商品编码","商品名称","规格","型号","单位","数量","单价","合计"]]
    @purchase_order.po_product_lists.each_with_index do |po_product,index|
      data << [index+1,po_product.product.product_id,po_product.product.name,po_product.product.specification,
               po_product.product.model,po_product.product.unit,po_product.product_purchase_amount,po_product.product_unit_price,
               po_product.subtotal]
    end
    data << ["","","","","","","","共计金额",@purchase_order.price]

    pdf.table(data,:cell_style => {:size => 10 }, :column_widths => [20,50,161,54,54,35,30,59,59])

    pdf.table([["交货日期：",@purchase_order.po_time_of_delivery.to_s],["订单备注：",@purchase_order.po_remarks]],
              :cell_style => {:border_width => 0, :size => 10 })

    pdf.draw_text "说明：1、本采购订单是采购合同一部分，采购订单合同组成完整的采购合同文件。其它条款按采购合同执行。", :size => 10, :at => [0,85]
    pdf.draw_text "2、贵公司收到采购单后关于对商品的数量交期问题，应于12小时内签字确认回传，否则视为默认。", :size => 10, :at => [30,70]
    pdf.draw_text "3、送货时请务必携带此订单（快递配送放入快递箱）。", :size => 10, :at => [30,55]
    pdf.draw_text "4、厂商回复栏：", :size => 10, :at => [30,40]
    pdf.draw_text "制单人：", :size => 10, :at => [0,0]
    pdf.draw_text "审核：", :size => 10, :at => [120,0]
    pdf.draw_text "审批：", :size => 10, :at => [240,0]
    pdf.draw_text "仓库确认：", :size => 10, :at => [360,0]

    po_id = @purchase_order.po_id
    #Dir.new "print_file" unless File.directory? "print_file"
    #Dir.new "print_file/#{po_id}" unless File.directory? "print_file/#{po_id}"
    FileUtils.makedirs "public/print_file/purchase/#{po_id}"

    pdf.render_file "public/print_file/purchase/#{po_id}/#{Time.now.strftime("%Y%m%d%H%M%S")}.pdf"
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end
end
