class CompanyScalesController < ApplicationController
  # GET /company_scales
  # GET /company_scales.xml
  def index
    @company_scales = CompanyScale.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company_scales }
    end
  end

  # GET /company_scales/1
  # GET /company_scales/1.xml
  def show
    @company_scale = CompanyScale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company_scale }
    end
  end

  # GET /company_scales/new
  # GET /company_scales/new.xml
  def new
    @company_scale = CompanyScale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company_scale }
    end
  end

  # GET /company_scales/1/edit
  def edit
    @company_scale = CompanyScale.find(params[:id])
  end

  # POST /company_scales
  # POST /company_scales.xml
  def create
    @company_scale = CompanyScale.new(params[:company_scale])

    respond_to do |format|
      if @company_scale.save
        format.html { redirect_to(@company_scale, :notice => 'Company scale was successfully created.') }
        format.xml  { render :xml => @company_scale, :status => :created, :location => @company_scale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company_scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /company_scales/1
  # PUT /company_scales/1.xml
  def update
    @company_scale = CompanyScale.find(params[:id])

    respond_to do |format|
      if @company_scale.update_attributes(params[:company_scale])
        format.html { redirect_to(@company_scale, :notice => 'Company scale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company_scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /company_scales/1
  # DELETE /company_scales/1.xml
  def destroy
    @company_scale = CompanyScale.find(params[:id])
    @company_scale.destroy

    respond_to do |format|
      format.html { redirect_to(company_scales_url) }
      format.xml  { head :ok }
    end
  end
end
