class Admin::SuppliersController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource
  skip_authorize_resource :only => :autocomplete_supplier_name
  autocomplete :supplier, :name

  def index
    @search = Supplier.search(params[:q])
    @suppliers = @search.result.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @suppliers }
    end
  end

  def show
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  def new
    @supplier = Supplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to([:admin,@supplier], :notice => 'Supplier was successfully created.') }
        format.xml  { render :xml => @supplier, :status => :created, :location => @supplier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        format.html { redirect_to([:admin,@supplier], :notice => 'Supplier was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to(admin_suppliers_url) }
      format.xml  { head :ok }
    end
  end
end
