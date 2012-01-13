class Admin::ProductPurchaseshipsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /product_purchaseships
  # GET /product_purchaseships.xml
  def index
    @product_purchaseships = ProductPurchaseship.find_all_by_purchase_id(params[:purchase_id])
  end

  # GET /product_purchaseships/1
  # GET /product_purchaseships/1.xml
  def show
    @product_purchaseship = ProductPurchaseship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_purchaseship }
    end
  end

  # GET /product_purchaseships/new
  # GET /product_purchaseships/new.xml
  def new
    @product_purchaseship = ProductPurchaseship.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /product_purchaseships/1/edit
  def edit
    @product_purchaseship = ProductPurchaseship.find(params[:id])
  end

  # POST /product_purchaseships
  # POST /product_purchaseships.xml
  def create
    @product_purchaseship = ProductPurchaseship.new(params[:product_purchaseship])
    @product_purchaseship.purchase_id = session[:purchase].id

    respond_to do |format|
      if @product_purchaseship.save
        format.html { redirect_to(admin_product_purchaseships_url, :notice => 'Product purchaseship was successfully created.') }
        format.xml  { render :xml => @product_purchaseship, :status => :created, :location => @product_purchaseship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_purchaseship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_purchaseships/1
  # PUT /product_purchaseships/1.xml
  def update
    @product_purchaseship = ProductPurchaseship.find(params[:id])

    respond_to do |format|
      if @product_purchaseship.update_attributes(params[:product_purchaseship])
        format.html { redirect_to(admin_product_purchaseships_url, :notice => 'Product purchaseship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_purchaseship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_purchaseships/1
  # DELETE /product_purchaseships/1.xml
  def destroy
    @product_purchaseship = ProductPurchaseship.find(params[:id])
    @product_purchaseship.destroy

    respond_to do |format|
      format.html { redirect_to(admin_purchases_url) }
      format.xml  { head :ok }
    end
  end
end
