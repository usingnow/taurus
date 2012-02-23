class Admin::CompanyExtendsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  # GET /company_extends
  # GET /company_extends.xml
  def index
    @search = CompanyExtend.search(params[:q])
    @company_extends = @search.result.paginate(:page => params[:page], :per_page => 20)

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
    @user = User.new
    @user.build_company_extend
  end

  # GET /company_extends/1/edit
  def edit
    @company_extend = CompanyExtend.find(params[:id])
  end

  # POST /company_extends
  # POST /company_extends.xml
  def create
    @user = User.new params[:user]
    @user.user_type = 2
    @company_extend = CompanyExtend.new(params[:company_extend])
    @company_extend.user = @user

    unless [@company_extend, @user].map(&:valid?).include?(false)
      @company_extend.company_no = current_company_no
      @company_extend.save
      redirect_to admin_company_extends_url
    else
      render :action => "new"
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
