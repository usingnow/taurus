class Admin::SkuProductshipsController < ApplicationController
  # GET /sku_productships
  # GET /sku_productships.xml
  def index
    if params[:sku_id] != nil
      sku_id = params[:sku_id]
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
    @sku_productship = SkuProductship.new(params[:sku_productship])
    @sku_productship.sku_id = session[:sku_id]

    respond_to do |format|
      if @sku_productship.save
        format.html { redirect_to(admin_sku_productships_url) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sku_productship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sku_productships/1
  # PUT /sku_productships/1.xml
  def update
    @sku_productship = SkuProductship.find(params[:id])

    respond_to do |format|
      if @sku_productship.update_attributes(params[:sku_productship])
        format.html { redirect_to(@sku_productship, :notice => 'Sku productship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sku_productship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sku_productships/1
  # DELETE /sku_productships/1.xml
  def destroy
    @sku_productship = SkuProductship.find(params[:id])
    @sku_productship.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sku_productships_url) }
      format.xml  { head :ok }
    end
  end
end
