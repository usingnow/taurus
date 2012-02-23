class Admin::PersonExtendsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def index

    @search = PersonExtend.search(params[:q])
    @person_extends = @search.result.paginate(:page => params[:page], :per_page => 20)

  end

  def new
    @user = User.new
    @user.build_person_extend
  end

  def create
    @user = User.new params[:user]
    @user.user_type = 1
    @person_extend = PersonExtend.new params[:person_extend]
    @person_extend.user = @user

    unless [@person_extend, @user].map(&:valid?).include?(false)
      @person_extend.person_no = current_person_no
      @person_extend.save
      redirect_to admin_person_extends_url
    else
      render :action => "new"
    end
  end

end
