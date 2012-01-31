class Admin::SkuProductshipsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /sku_productships
  # GET /sku_productships.xml
  def index
    if params[:sku_id] != nil
      sku_id = params[:sku_id]
      session[:sku_id] = sku_id
    else
      sku_id = session[:sku_id]
    end

    @sku_productships = SkuProductship.find_all_by_sku_id(sku_id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sku_productships }
    end
  end

  # GET /sku_productships/1
  # GET /sku_productships/1.xml
  def show
    @sku_productship = SkuProductship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sku_productship }
    end
  end

  # GET /sku_productships/new
  # GET /sku_productships/new.xml
  def new
    @sku_productship = SkuProductship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sku_productship }
    end
  end

  # GET /sku_productships/1/edit
  def edit
    @sku_productship = SkuProductship.find(params[:id])
  end

  # POST /sku_productships
  # POST /sku_productships.xml
  def create
    sku_productship = SkuProductship.new(:product_id => params[:product_id])
    sku_productship.sku_id = session[:sku_id]

    sku_productship.save
    @sku_productships = SkuProductship.find_all_by_sku_id session[:sku_id]

    render :partial => "line_items"
  end

  def update
    sku_productship = SkuProductship.find(params[:id])

    sku_productship.update_attributes(params[:sku_productship])

    @sku_productships = SkuProductship.find_all_by_sku_id session[:sku_id]

    render :partial => "line_items"
  end


  def destroy
    sku_productship = SkuProductship.find(params[:id])
    sku_productship.destroy

    @sku_productships = SkuProductship.find_all_by_sku_id session[:sku_id]

    render :partial => "line_items"
  end

  def search_products
    @query = Product.search(params[:q])
    @products = @query.result.paginate(:page => params[:page], :per_page => 20)
  end
end
