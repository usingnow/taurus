class Commodity::Admin::SkusController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource


  def index
    @search = Sku.search(params[:q])
    @search.sorts = "updated_at desc"
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /skus/1
  # GET /skus/1.xml
  def show
    @sku = Sku.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sku }
    end
  end

  # GET /skus/new
  # GET /skus/new.xml
  def new
    @sku = Sku.new
    @sku.cost_aft_tax = 0.00
    @sku.cost_bef_tax = 0.00
    @sku.assembling_fee_aft_tax = 0.00
    @sku.assembling_fee_bef_tax = 0.00
    @sku.installation_cost_aft_tax = 0.00
    @sku.installation_cost_bef_tax = 0.00
    @sku.market_price = 0.00


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sku }
    end
  end

  # GET /skus/1/edit
  def edit
    @sku = Sku.find(params[:id])
    @sku.brand_name = @sku.brand.chinese_name
    @sku.sku_category_name = @sku.sku_category.name
    @sku.sku_category_number = @sku.sku_category.number
  end

  # POST /skus
  # POST /skus.xml
  def create
    @sku = Sku.new(params[:sku])
    @sku.total_sale = 0
    @sku.create_by = current_administrator.name

    respond_to do |format|
      if @sku.save
        session[:sku_id] = @sku.id
        format.html { redirect_to(admin_sku_productships_url) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sku.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skus/1
  # PUT /skus/1.xml
  def update
    @sku = Sku.find(params[:id])

    respond_to do |format|
      if @sku.update_attributes(params[:sku])
        format.html { redirect_to([:admin,@sku], :notice => 'Sku was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sku.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skus/1
  # DELETE /skus/1.xml
  def destroy
    @sku = Sku.find(params[:id])
    @sku.destroy

    respond_to do |format|
      format.html { redirect_to(commodity_admin_skus_url) }
      format.xml  { head :ok }
    end
  end

  def add
    @sku = session[:sku]
    @sku.save

    @sku_productships = session[:sku_productships]
    @sku_productships.each do |sku_productship|
      sku_productship.sku_id = @sku.id
      @sku_productship = sku_productship
      @sku_productship.save
    end

    @sku_images = session[:sku_images]
    @sku_images.each do |sku_image|
      sku_image.sku_id = @sku.id
      @sku_image = sku_image
      @sku_image.save
    end

    respond_to do |format|
       format.html { redirect_to(commodity_admin_skus_url) }
    end
  end

   def search
    @search = Sku.search(params[:q])
    @search.sorts = 'updated_at desc'
    @skus = @search.result.paginate(:page => params[:page],:per_page => 20)
    @order_id = params[:order_id]
  end
end
