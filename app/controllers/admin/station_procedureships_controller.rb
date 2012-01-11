class Admin::StationProcedureshipsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  # GET /station_procedureships
  # GET /station_procedureships.xml
  def index
    if !params[:station_procedureship].nil?
      @procedure = current_procedure(params[:station_procedureship][:procedure_id])
    else
      if !session[:procedure_id].nil?
        @procedure = current_procedure(session[:procedure_id])
      else
        @procedure = current_procedure(nil)
      end
    end


    @station_procedureships = StationProcedureship.find_all_by_procedure_id(@procedure.id)

    session[:procedure_id] = @procedure.id

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @station_procedureships }
    end
  end

  # GET /station_procedureships/1
  # GET /station_procedureships/1.xml
  def show
    @station_procedureship = StationProcedureship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @station_procedureship }
    end
  end

  # GET /station_procedureships/new
  # GET /station_procedureships/new.xml
  def new
    @station_procedureship = StationProcedureship.new
    @station_procedureship.procedure_id = params[:procedure_id]

    @procedure = Procedure.find(params[:procedure_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @station_procedureship }
    end
  end

  # GET /station_procedureships/1/edit
  def edit
    @station_procedureship = StationProcedureship.find(params[:id])
  end

  # POST /station_procedureships
  # POST /station_procedureships.xml
  def create
    @station_procedureship = StationProcedureship.new(params[:station_procedureship])

    respond_to do |format|
      if @station_procedureship.save
        format.html { redirect_to(admin_station_procedureships_url, :notice => 'Station procedureship was successfully created.') }
        format.xml  { render :xml => @station_procedureship, :status => :created, :location => @station_procedureship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @station_procedureship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /station_procedureships/1
  # PUT /station_procedureships/1.xml
  def update
    @station_procedureship = StationProcedureship.find(params[:id])

    respond_to do |format|
      if @station_procedureship.update_attributes(params[:station_procedureship])
        format.html { redirect_to(admin_station_procedureships_url, :notice => 'Station procedureship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @station_procedureship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /station_procedureships/1
  # DELETE /station_procedureships/1.xml
  def destroy
    @station_procedureship = StationProcedureship.find(params[:id])
    @station_procedureship.destroy

    respond_to do |format|
      format.html { redirect_to(admin_station_procedureships_url) }
      format.xml  { head :ok }
    end
  end
end
