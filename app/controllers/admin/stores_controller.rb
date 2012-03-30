class Admin::StoresController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def index
    @stores = Store.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stores }
    end
  end

  def show
    @store = Store.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store }
    end
  end

  def new
    @store = Store.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store }
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(params[:store])

    respond_to do |format|
      if @store.save
        format.html { redirect_to([:admin,@store], :notice => 'Store was successfully created.') }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @store = Store.find(params[:id])

    respond_to do |format|
      if @store.update_attributes(params[:store])
        format.html { redirect_to([:admin,@store], :notice => 'Store was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    respond_to do |format|
      format.html { redirect_to(admin_stores_url) }
      format.xml  { head :ok }
    end
  end
end
