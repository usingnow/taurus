class Admin::SkuImagesController < ApplicationController
  # GET /sku_images
  # GET /sku_images.xml
  def index
    @sku_images = session[:sku_images] ||= Array.new
    session[:sku_images] = @sku_images

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
    sku_image = SkuImage.new(params[:sku_image])

    img = params[:image_url]
    content_size = img.size
    file_data = img.read
    @file_type = img.content_type
    @file_name = img.original_filename
    File.open(RAILS_ROOT+"/public/uploads/images/"+@file_name,"wb"){ |f| f.write(file_data) }
    sku_image.image_url = "/uploads/images/"+@file_name

    @sku_image = sku_image



    @sku_images = session[:sku_images] ||= Array.new
    @sku_images<<@sku_image

    respond_to do |format|
        format.html { redirect_to(admin_sku_images_path) }
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
