class Admin::SkuCategoriesController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource
  skip_authorize_resource :only => [:autocomplete_sku_category_name, :check]
  autocomplete :sku_category, :name, :extra_data => [:number], :scopes => [:four]

  def index
    @search = SkuCategory.search(params[:q])
    @search.sorts = "updated_at desc"
    @sku_categories = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /sku_categories/1
  # GET /sku_categories/1.xml
  def show
    @sku_category = SkuCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sku_category }
    end
  end

  # GET /sku_categories/new
  # GET /sku_categories/new.xml
  def new
    @sku_category = SkuCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sku_category }
    end
  end

  # GET /sku_categories/1/edit
  def edit
    @sku_category = SkuCategory.find(params[:id])
  end

  # POST /sku_categories
  # POST /sku_categories.xml
  def create
    @sku_category = SkuCategory.new(params[:sku_category])

    respond_to do |format|
      if @sku_category.save
        format.html { redirect_to([:admin,@sku_category], :notice => 'Sku category was successfully created.') }
        format.xml  { render :xml => @sku_category, :status => :created, :location => @sku_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sku_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sku_categories/1
  # PUT /sku_categories/1.xml
  def update
    @sku_category = SkuCategory.find(params[:id])

    respond_to do |format|
      if @sku_category.update_attributes(params[:sku_category])
        format.html { redirect_to([:admin,@sku_category], :notice => 'Sku category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sku_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sku_categories/1
  # DELETE /sku_categories/1.xml
  def destroy
    @sku_category = SkuCategory.find(params[:id])
    @sku_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sku_categories_url) }
      format.xml  { head :ok }
    end
  end

  def check
    sku_category = SkuCategory.find_by_number(params[:number])

    if sku_category.nil?
      render :json => "failure".to_json
    else
      render :json => sku_category.to_json
    end
  end
end
