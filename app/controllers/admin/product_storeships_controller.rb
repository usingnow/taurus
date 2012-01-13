class Admin::ProductStoreshipsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /product_storeships
  # GET /product_storeships.xml
  def index
    @product_storeships = ProductStoreship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_storeships }
    end
  end

  # GET /product_storeships/1
  # GET /product_storeships/1.xml
  def show
    @product_storeship = ProductStoreship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_storeship }
    end
  end

  # GET /product_storeships/new
  # GET /product_storeships/new.xml
  def new
    @product_storeship = ProductStoreship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_storeship }
    end
  end

  # GET /product_storeships/1/edit
  def edit
    @product_storeship = ProductStoreship.find(params[:id])
  end

  # POST /product_storeships
  # POST /product_storeships.xml
  def create
    @product_storeship = ProductStoreship.new(params[:product_storeship])

    respond_to do |format|
      if @product_storeship.save
        format.html { redirect_to(@product_storeship, :notice => 'Product storeship was successfully created.') }
        format.xml  { render :xml => @product_storeship, :status => :created, :location => @product_storeship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_storeship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_storeships/1
  # PUT /product_storeships/1.xml
  def update
    @product_storeship = ProductStoreship.find(params[:id])

    respond_to do |format|
      if @product_storeship.update_attributes(params[:product_storeship])
        format.html { redirect_to(@product_storeship, :notice => 'Product storeship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_storeship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_storeships/1
  # DELETE /product_storeships/1.xml
  def destroy
    @product_storeship = ProductStoreship.find(params[:id])
    @product_storeship.destroy

    respond_to do |format|
      format.html { redirect_to(product_storeships_url) }
      format.xml  { head :ok }
    end
  end
end
