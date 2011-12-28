class Admin::StationsController < ApplicationController
  # GET /admin/stations
  # GET /admin/stations.xml
  def index
    @stations = Station.all(:order=>"sequence")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations }
    end
  end

  # GET /admin/stations/1
  # GET /admin/stations/1.xml
  def show
    @station = Station.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @station }
    end
  end

  # GET /admin/stations/new
  # GET /admin/stations/new.xml
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @station }
    end
  end

  # GET /admin/stations/1/edit
  def edit
    @station = Station.find(params[:id])
  end

  # POST /admin/stations
  # POST /admin/stations.xml
  def create
    @station = Station.new(params[:station])

    respond_to do |format|
      if @station.save
        format.html { redirect_to([:admin,@station], :notice => 'Station was successfully created.') }
        format.xml  { render :xml => @station, :status => :created, :location => @station }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/stations/1
  # PUT /admin/stations/1.xml
  def update
    @station = Station.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to([:admin,@station], :notice => 'Station was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stations/1
  # DELETE /admin/stations/1.xml
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to(admin_stations_url) }
      format.xml  { head :ok }
    end
  end
end
