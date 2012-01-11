class Admin::ProductStoreEntryshipsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  # GET /product_store_entryships
  # GET /product_store_entryships.xml
  def index
    @product_store_entryships = ProductStoreEntryship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_store_entryships }
    end
  end

  # GET /product_store_entryships/1
  # GET /product_store_entryships/1.xml
  def show
    @product_store_entryship = ProductStoreEntryship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_store_entryship }
    end
  end

  # GET /product_store_entryships/new
  # GET /product_store_entryships/new.xml
  def new
    @product_store_entryship = ProductStoreEntryship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_store_entryship }
    end
  end

  # GET /product_store_entryships/1/edit
  def edit
    @product_store_entryship = ProductStoreEntryship.find(params[:id])
  end

  # POST /product_store_entryships
  # POST /product_store_entryships.xml
  def create
    product_store_entryship = ProductStoreEntryship.new(params[:product_store_entryship])

    product_store_entryships = []
    product_store_entryships << product_store_entryship

    session[:product_store_entryships] = product_store_entryships

    respond_to do |format|
      if session[:product_store_entryships]
        format.html { redirect_to(new_admin_store_entry_path, :notice => 'Product store entryship was successfully created.') }
        format.xml  { render :xml => @product_store_entryship, :status => :created, :location => @product_store_entryship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_store_entryship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_store_entryships/1
  # PUT /product_store_entryships/1.xml
  def update
    @product_store_entryship = ProductStoreEntryship.find(params[:id])

    respond_to do |format|
      if @product_store_entryship.update_attributes(params[:product_store_entryship])
        format.html { redirect_to(@product_store_entryship, :notice => 'Product store entryship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_store_entryship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_store_entryships/1
  # DELETE /product_store_entryships/1.xml
  def destroy
    @product_store_entryship = ProductStoreEntryship.find(params[:id])
    @product_store_entryship.destroy

    respond_to do |format|
      format.html { redirect_to(product_store_entryships_url) }
      format.xml  { head :ok }
    end
  end
end
