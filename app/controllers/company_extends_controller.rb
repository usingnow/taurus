class CompanyExtendsController < ApplicationController
  # GET /company_extends
  # GET /company_extends.xml
  def index
    @company_extends = CompanyExtend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company_extends }
    end
  end

  # GET /company_extends/1
  # GET /company_extends/1.xml
  def show
    @company_extend = CompanyExtend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company_extend }
    end
  end

  # GET /company_extends/new
  # GET /company_extends/new.xml
  def new
    @company_extend = CompanyExtend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company_extend }
    end
  end

  # GET /company_extends/1/edit
  def edit
    @company_extend = CompanyExtend.find(params[:id])
  end

  # POST /company_extends
  # POST /company_extends.xml
  def create
    @company_extend = CompanyExtend.new(params[:company_extend])

    respond_to do |format|
      if @company_extend.save
        format.html { redirect_to(@company_extend, :notice => 'Company extend was successfully created.') }
        format.xml  { render :xml => @company_extend, :status => :created, :location => @company_extend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company_extend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /company_extends/1
  # PUT /company_extends/1.xml
  def update
    @company_extend = CompanyExtend.find(params[:id])

    respond_to do |format|
      if @company_extend.update_attributes(params[:company_extend])
        format.html { redirect_to(@company_extend, :notice => 'Company extend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company_extend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /company_extends/1
  # DELETE /company_extends/1.xml
  def destroy
    @company_extend = CompanyExtend.find(params[:id])
    @company_extend.destroy

    respond_to do |format|
      format.html { redirect_to(company_extends_url) }
      format.xml  { head :ok }
    end
  end
end
