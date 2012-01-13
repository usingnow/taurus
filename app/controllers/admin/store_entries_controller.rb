class Admin::StoreEntriesController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /store_entries
  # GET /store_entries.xml
  def index
    @store_entries = StoreEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @store_entries }
    end
  end

  # GET /store_entries/1
  # GET /store_entries/1.xml
  def show
    @store_entry = StoreEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store_entry }
    end
  end

  # GET /store_entries/new
  # GET /store_entries/new.xml
  def new
    @store_entry = session[:store_entry] ||= StoreEntry.new

    @product_store_entryships = session[:product_store_entryships] ||= []
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store_entry }
    end
  end

  # GET /store_entries/1/edit
  def edit
    @store_entry = StoreEntry.find(params[:id])
  end

  # POST /store_entries
  # POST /store_entries.xml
  def create
    @store_entry = StoreEntry.new(params[:store_entry])
    @store_entry.number = current_serial_number("SE")

    admin_id = current_administrator.id

    store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,1)

    respond_to do |format|
      if @store_entry.save

        line_items = []

        store_entry_product_carts.each do |cart|
          line_items << {:store_entry_id => @store_entry.id,
                         :product_id => cart.product_id,
                         :quantity => cart.quantity,
                         :delivery_date => cart.delivery_date}
        end

        if ProductStoreEntryship.create(line_items)
          if destroy_sepc_by_admin_id(admin_id) #删除
            change_store_quantity(store_entry_product_carts,@store_entry.store_id)
          end
        end

        format.html { redirect_to([:admin,@store_entry], :notice => 'Store entry was successfully created.') }
        format.xml  { render :xml => @store_entry, :status => :created, :location => @store_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_entries/1
  # PUT /store_entries/1.xml
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

  # DELETE /store_entries/1
  # DELETE /store_entries/1.xml
  def destroy
    @store_entry = StoreEntry.find(params[:id])
    @store_entry.destroy

    respond_to do |format|
      format.html { redirect_to(admin_store_entries_url) }
      format.xml  { head :ok }
    end
  end
end
