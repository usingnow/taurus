class Admin::PickUpsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

   # GET /pick_ups
  # GET /pick_ups.xml
  def index
    @pick_ups = PickUp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pick_ups }
    end
  end

  # GET /pick_ups/1
  # GET /pick_ups/1.xml
  def show
    @pick_up = PickUp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pick_up }
    end
  end

  # GET /pick_ups/new
  # GET /pick_ups/new.xml
  def new
    @pick_up = PickUp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pick_up }
    end
  end

  # GET /pick_ups/1/edit
  def edit
    @pick_up = PickUp.find(params[:id])
  end

  # POST /pick_ups
  # POST /pick_ups.xml
  def create
    @pick_up = PickUp.new(params[:pick_up])

    respond_to do |format|
      if @pick_up.save
        format.html { redirect_to([:admin,@pick_up], :notice => 'Pick up was successfully created.') }
        format.xml  { render :xml => @pick_up, :status => :created, :location => @pick_up }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pick_up.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pick_ups/1
  # PUT /pick_ups/1.xml
  def update
    @pick_up = PickUp.find(params[:id])

    respond_to do |format|
      if @pick_up.update_attributes(params[:pick_up])
        format.html { redirect_to([:admin,@pick_up], :notice => 'Pick up was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pick_up.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pick_ups/1
  # DELETE /pick_ups/1.xml
  def destroy
    @pick_up = PickUp.find(params[:id])
    @pick_up.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pick_ups_url) }
      format.xml  { head :ok }
    end
  end
end