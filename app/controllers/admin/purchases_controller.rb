class Admin::PurchasesController < ApplicationController
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.xml
  def create
    @purchase = Purchase.new(params[:purchase])
    @purchase.number = current_serial_number('EME')

    admin_id = current_administrator.id

    store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,0)

    respond_to do |format|
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
          destroy_sepc_by_admin_id(admin_id) #删除
        end
        format.html { redirect_to(admin_purchases_url, :notice => 'Purchase was successfully created.') }
        format.xml  { render :xml => @purchase, :status => :created, :location => @purchase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.xml
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

  # DELETE /purchases/1
  # DELETE /purchases/1.xml
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to(admin_purchases_url) }
      format.xml  { head :ok }
    end
  end
end
