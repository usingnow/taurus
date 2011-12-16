class Admin::SkusController < ApplicationController
  # GET /skus
  # GET /skus.xml
  def index
    @skus = Sku.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skus }
    end
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sku }
    end
  end

  # GET /skus/1/edit
  def edit
    @sku = Sku.find(params[:id])
  end

  # POST /skus
  # POST /skus.xml
  def create
    @sku = Sku.new(params[:sku])

    @sku_productships = Array.new
    session[:sku_productships] = @sku_productships
    session[:sku_images] = nil
    session[:sku] = @sku

    respond_to do |format|
      format.html { redirect_to(admin_sku_productships_url) }
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
      format.html { redirect_to(admin_skus_url) }
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
       format.html { redirect_to(admin_skus_url) }
    end
  end
end
