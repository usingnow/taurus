class Admin::CompanyExtendsController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @search = CompanyExtend.search(params[:q])
    @company_extends = @search.result.paginate(:page => params[:page], :per_page => 20)

  end

  def show
    @company_extend = CompanyExtend.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_company_extend
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new params[:user]
    @user.user_type = 2

    if @user.save
      @user.update_attribute(:confirmed_at, Time.now)
      redirect_to admin_company_extends_url
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_company_extends_path
    else
      render :action => "edit"
    end
  end
end
