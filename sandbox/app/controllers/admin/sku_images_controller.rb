#encoding:UTF-8
class Admin::SkuImagesController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def index
    session[:sku_id] = params[:sku_id] if params[:sku_id]

    @sku_productships = SkuProductship.find_all_by_sku_id(session[:sku_id])
    return redirect_to admin_sku_productships_path, :alert => "请至少添加一个素材商品" if @sku_productships.size == 0

    @sku_images = SkuImage.find_all_by_sku_id(session[:sku_id])
  end


  def show
    @sku_image = SkuImage.find(params[:id])
  end


  def new
    @sku_image = SkuImage.new

  end

  def edit
    @sku_image = SkuImage.find(params[:id])
  end

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

  def destroy
    @sku_image = SkuImage.find(params[:id])
    @sku_image.destroy

    redirect_to admin_sku_images_path(:sku_id => session[:sku_id])
  end
end
