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
end
