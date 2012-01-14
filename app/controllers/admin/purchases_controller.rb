#encoding:UTF-8
class Admin::PurchasesController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  # GET /purchases
  # GET /purchases.xml
  def index
    @purchases = Purchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.xml
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.xml
  def new
    @purchase = Purchase.new
    @purchase_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(current_administrator.id,0)
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.xml
  def create
    admin_id = current_administrator.id

    #取出将要添加的商品
    store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,0) #0：采购单，1：入库单 类型区分，

    if store_entry_product_carts.empty?
      @purchase = Purchase.new
      @purchase.errors.add("商品","至少一件")
      render "new"
      return
    end

    @purchase = Purchase.new(params[:purchase])
    @purchase.status = 0
    @purchase.number = current_serial_number('EME')

    if @purchase.save

      line_items = []

      store_entry_product_carts.each do |cart|
        line_items << {:purchase_id => @purchase.id,
                       :product_id => cart.product_id,
                       :quantity => cart.quantity,
                       :unit_price_aft_tax => cart.unit_price_aft_tax,
                       :total_amount => cart.total_amount,
                       :delivery_date => cart.delivery_date}
      end

      if ProductPurchaseship.create(line_items)
        destroy_sepc_by_admin_id(admin_id,0) #删除
      end
      redirect_to(admin_purchases_url)
    else
      render :action => "new"
    end
  end


  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to([:admin,@purchase], :notice => 'Purchase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to(admin_purchases_url) }
      format.xml  { head :ok }
    end
  end

  def next
    @purchase = Purchase.find(params[:id])
    @purchase.update_attributes(:status => params[:status])
    redirect_to admin_purchases_url
  end

  #待入库采购单
  def be_store
    @search = Purchase.search("status_eq" => "1")
    @search.sorts = "updated_at desc"
    @purchases = @search.result.paginate(:page => params[:page], :per_page => "20")
  end
end
