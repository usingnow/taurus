class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  #注册选择页面
  def registration
    respond_to do |format|
      format.html { render :layout => "home" }
    end
  end

  #个人会员注册页面
  def person_reg
    @user = User.new

    respond_to do |format|
      format.html { render :layout => "home" }
      format.xml  { render :xml => @user }
    end
  end

  #企业会员注册页面
  def company_reg
    @user = User.new

    respond_to do |format|
      format.html { render :layout => "home" }
      format.xml  { render :xml => @user }
    end
  end

  #个人会员注册
  def person_enroll
    user = User.new
    user.login_no = params[:login_no]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]

    person_extend = PersonExtend.new
    person_extend.name = params[:name]
    person_extend.email = params[:email]
    person_extend.email_confirmation = params[:email_confirmation]

    @user = user
    @person_extend = person_extend

    respond_to do |format|
      if @user.save&&@person_extend.save
        format.html { redirect_to(home_url, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "person_reg", :layout => "home"}
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  #企业会员注册
  def company_enroll
    user = User.new
    user.login_no = params[:login_no]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]

    company_extend = CompanyExtend.new
    company_extend.email = params[:email]
    company_extend.email_confirmation = params[:email_confirmation]

    @user = user
    @company_extend = company_extend

    respond_to do |format|
      if @user.save&&@company_extend.save
        format.html { redirect_to(home_url, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "company_reg", :layout => "home"}
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  #登录页面
  def login
     @user = User.new

    respond_to do |format|
      format.html { render :layout => "home"}
      format.xml  { render :xml => @user }
    end
  end

  #登录
  def sign_in
    user = User.find_by_login_no_and_password(params[:login_no],params[:password])

    respond_to do |format|
      if user == nil
        format.html{ render :action => "login", :notice => 'error', :layout=>"home"}
      else
        session[:user] = user
        format.html { redirect_to(home_url) }
      end

    end
  end
end
