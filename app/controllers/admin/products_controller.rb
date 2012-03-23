class Admin::ProductsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource
  skip_authorize_resource :only => :search


  def index
    @search = Product.search(params[:q])
    @search.sorts = "updated_at desc"
    @products = @search.result.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end


  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product.brand_name = @product.brand.chinese_name
    @product.supplier_name = @product.supplier.name
    @product.product_category_name = @product.product_category.name
    @product.product_category_number = @product.product_category.number
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save && set_store_to_product(@product,params[:store_id])
        format.html { redirect_to([:admin,@product], :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product]) && set_store_to_product(@product,params[:store_id])
        format.html { redirect_to([:admin,@product], :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  def search
     @query = Product.search(params[:q])
     @products = @query.result.paginate(:page => params[:page], :per_page => 20)
     @cart_type = params[:cart_type]  # 判断是采购单还是入库单

     respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
end
