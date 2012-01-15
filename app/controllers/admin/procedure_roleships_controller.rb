class Admin::ProcedureRoleshipsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /procedure_roleships
  # GET /procedure_roleships.xml
  def index
    @procedure_roleships = ProcedureRoleship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  {render :xml => @procedure_roleships}
    end
  end

  # GET /procedure_roleships/1
  # GET /procedure_roleships/1.xml
  def show
    @procedure_roleship = ProcedureRoleship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @procedure_roleship }
    end
  end

  # GET /procedure_roleships/new
  # GET /procedure_roleships/new.xml
  def new
    @procedure_roleships = ProcedureRoleship.find_all_by_role_id(params[:id])

    @role_id = params[:id]

    @procedure_roleship = ProcedureRoleship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @procedure_roleship }
    end
  end

  # GET /procedure_roleships/1/edit
  def edit
    @procedure_roleship = ProcedureRoleship.find(params[:id])
  end

  # POST /procedure_roleships
  # POST /procedure_roleships.xml
  def create
    procedure_ids = params[:procedure_id]

    ProcedureRoleship.destroy_all(:role_id=>params[:role_id])

    if !procedure_ids.nil?
      procedure_ids.each do |procedure_id|
        @procedure_roleship = ProcedureRoleship.new
        @procedure_roleship.procedure_id = procedure_id
        @procedure_roleship.role_id = params[:role_id]
        @procedure_roleship.save
      end
    end
    redirect_to(admin_roles_url)
  end

  # PUT /procedure_roleships/1
  # PUT /procedure_roleships/1.xml
  def update
    @procedure_roleship = ProcedureRoleship.find(params[:id])

    respond_to do |format|
      if @procedure_roleship.update_attributes(params[:procedure_roleship])
        format.html { redirect_to(@procedure_roleship, :notice => 'Procedure roleship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @procedure_roleship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /procedure_roleships/1
  # DELETE /procedure_roleships/1.xml
  def destroy
    @procedure_roleship = ProcedureRoleship.find(params[:id])
    @procedure_roleship.destroy

    respond_to do |format|
      format.html { redirect_to(procedure_roleships_url) }
      format.xml  { head :ok }
    end
  end
end
