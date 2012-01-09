class CompanyTypesController < ApplicationController
  # GET /company_types
  # GET /company_types.xml
  def index
    @company_types = CompanyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company_types }
    end
  end

  # GET /company_types/1
  # GET /company_types/1.xml
  def show
    @company_type = CompanyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company_type }
    end
  end

  # GET /company_types/new
  # GET /company_types/new.xml
  def new
    @company_type = CompanyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company_type }
    end
  end

  # GET /company_types/1/edit
  def edit
    @company_type = CompanyType.find(params[:id])
  end

  # POST /company_types
  # POST /company_types.xml
  def create
    @company_type = CompanyType.new(params[:company_type])

    respond_to do |format|
      if @company_type.save
        format.html { redirect_to(@company_type, :notice => 'Company type was successfully created.') }
        format.xml  { render :xml => @company_type, :status => :created, :location => @company_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /company_types/1
  # PUT /company_types/1.xml
  def update
    @company_type = CompanyType.find(params[:id])

    respond_to do |format|
      if @company_type.update_attributes(params[:company_type])
        format.html { redirect_to(@company_type, :notice => 'Company type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /company_types/1
  # DELETE /company_types/1.xml
  def destroy
    @company_type = CompanyType.find(params[:id])
    @company_type.destroy

    respond_to do |format|
      format.html { redirect_to(company_types_url) }
      format.xml  { head :ok }
    end
  end
end
