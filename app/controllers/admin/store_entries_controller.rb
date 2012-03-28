#encoding:UTF-8
class Admin::StoreEntriesController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @search = StoreEntry.search(params[:q])
    @search.sorts = "created_at desc"
    @store_entries = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @store_entry = StoreEntry.find(params[:id])
    if @store_entry.store_in_type == 1
      render "purchase_show"
    end
  end

  def new
    @store_entry = StoreEntry.new
    admin_id = current_administrator.id
    purchase_order_id = params[:purchase_order_id]

    if purchase_order_id != nil
      purchase_order = PurchaseOrder.find(purchase_order_id)
      @store_entry.purchase_order_id = purchase_order.id
      @store_entry.ordering_company_id = purchase.ordering_company_id
      @store_entry.supplier_id = purchase.supplier_id
      StoreEntryProductCart.destroy_all(:admin_id => admin_id, :cart_type => 1)
      line_items = []
      purchase.product_purchaseships.each do |ship|
        line_items << {:product_id => ship.product_id, :quantity => ship.quantity,
                       :delivery_date => ship.delivery_date, :admin_id => admin_id, :cart_type => 1}
      end
      StoreEntryProductCart.create(line_items)
    end

    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,1)
  end

  def edit
    @store_entry = StoreEntry.find(params[:id])
  end

  def create
    admin_id = current_administrator.id

    #取出将要添加的商品
    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,1) #0：采购单，1：入库单 类型区分，

    if @store_entry_product_carts.empty?
      @store_entry = StoreEntry.new
      @store_entry.errors.add("商品","至少一件")
      render "new"
      return
    end

    @store_entry = StoreEntry.new(params[:store_entry])
    @store_entry.number = current_serial_number("SE")
    @store_entry.administrator_id = current_administrator.id

    if @store_entry.save

      line_items = []

      @store_entry_product_carts.each do |cart|
        line_items << {:store_entry_id => @store_entry.id,
                       :product_id => cart.product_id,
                       :quantity => cart.quantity,
                       :delivery_date => cart.delivery_date}
      end

      if ProductStoreEntryship.create(line_items)
        if destroy_sepc_by_admin_id(admin_id,1) #删除入库单商品购物车
          change_store_quantity(@store_entry_product_carts,@store_entry.store_id)
          if !@store_entry.purchase_order_id.nil?
            @purchase = Purchase.find(@store_entry.purchase_order_id)
            @purchase.update_attributes(:status => 2)
          end
        end
      end

      redirect_to(admin_store_entries_url)
    else
      render :action => "new"
    end
  end

  def update
    @store_entry = StoreEntry.find(params[:id])

    respond_to do |format|
      if @store_entry.update_attributes(params[:store_entry])
        format.html { redirect_to(@store_entry, :notice => 'Store entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def purchase_orders
    @search = PurchaseOrder.released.search(params[:q])
    @purchase_orders = @search.result.paginate(:page => params[:page], :per_page => 15)
  end

  def new_from_po
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def create_from_po
    @purchase_order = PurchaseOrder.find(params[:id])
    @store_entry = StoreEntry.new(:number => current_serial_number("SE"), :purchase_order_id => @purchase_order.id,
                                  :ordering_company_id => @purchase_order.ordering_company_id, :supplier_id => @purchase_order.supplier_id,
                                  :store_id => 1)

    params[:quantity].each do |key,value|
      if value.to_i > 0
        @store_entry.product_store_entryships << ProductStoreEntryship.new(:product_id => key,:quantity => value, :delivery_date => @purchase_order.po_time_of_delivery)
      end
    end

    if @store_entry.save
      change_store_quantity(@store_entry.product_store_entryships,@store_entry.store_id)
      @purchase_order.update_attributes(:po_store_status => true)
    end
    redirect_to admin_store_entries_url
  end
end
