class Admin::OrderingCompaniesController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  # GET /ordering_companies
  # GET /ordering_companies.xml
  def index
    @ordering_companies = OrderingCompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordering_companies }
    end
  end

  # GET /ordering_companies/1
  # GET /ordering_companies/1.xml
  def show
    @ordering_company = OrderingCompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ordering_company }
    end
  end

  # GET /ordering_companies/new
  # GET /ordering_companies/new.xml
  def new
    @ordering_company = OrderingCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ordering_company }
    end
  end

  # GET /ordering_companies/1/edit
  def edit
    @ordering_company = OrderingCompany.find(params[:id])
  end

  # POST /ordering_companies
  # POST /ordering_companies.xml
  def create
    @ordering_company = OrderingCompany.new(params[:ordering_company])

    respond_to do |format|
      if @ordering_company.save
        format.html { redirect_to([:admin,@ordering_company], :notice => 'Ordering company was successfully created.') }
        format.xml  { render :xml => @ordering_company, :status => :created, :location => @ordering_company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ordering_company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ordering_companies/1
  # PUT /ordering_companies/1.xml
  def update
    @ordering_company = OrderingCompany.find(params[:id])

    respond_to do |format|
      if @ordering_company.update_attributes(params[:ordering_company])
        format.html { redirect_to([:admin,@ordering_company], :notice => 'Ordering company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ordering_company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ordering_companies/1
  # DELETE /ordering_companies/1.xml
  def destroy
    @ordering_company = OrderingCompany.find(params[:id])
    @ordering_company.destroy

    respond_to do |format|
      format.html { redirect_to(ordering_companies_url) }
      format.xml  { head :ok }
    end
  end
end
