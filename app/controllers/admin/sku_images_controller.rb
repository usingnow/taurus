class Admin::SkuImagesController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /sku_images
  # GET /sku_images.xml
  def index
    session[:sku_id] = params[:sku_id] if params[:sku_id]

    @sku_images = SkuImage.find_all_by_sku_id(session[:sku_id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /sku_images/1
  # GET /sku_images/1.xml
  def show
    @sku_image = SkuImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sku_image }
    end
  end

  # GET /sku_images/new
  # GET /sku_images/new.xml
  def new
    @sku_image = SkuImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sku_image }
    end
  end

  # GET /sku_images/1/edit
  def edit
    @sku_image = SkuImage.find(params[:id])
  end

  # POST /sku_images
  # POST /sku_images.xml
  def create
    @sku_image = SkuImage.new({:sku_id => session[:sku_id]}.merge(params[:sku_image]))

    respond_to do |format|
      if @sku_image.save
        format.html { redirect_to(admin_sku_images_path) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sku_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sku_images/1
  # PUT /sku_images/1.xml
  def update
    @sku_image = SkuImage.find(params[:id])

    respond_to do |format|
      if @sku_image.update_attributes(params[:sku_image])
        format.html { redirect_to(@sku_image, :notice => 'Sku image was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sku_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sku_images/1
  # DELETE /sku_images/1.xml
  def destroy
    @sku_image = SkuImage.find(params[:id])
    @sku_image.destroy

    respond_to do |format|
      format.html { redirect_to(sku_images_url) }
      format.xml  { head :ok }
    end
  end
end
