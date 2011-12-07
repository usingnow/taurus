class Admin::AdminGroupsController < ApplicationController
  # GET /admin_groups
  # GET /admin_groups.xml
  def index
    @admin_groups = AdminGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_groups }
    end
  end

  # GET /admin_groups/1
  # GET /admin_groups/1.xml
  def show
    @admin_group = AdminGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_group }
    end
  end

  # GET /admin_groups/new
  # GET /admin_groups/new.xml
  def new
    @admin_group = AdminGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_group }
    end
  end

  # GET /admin_groups/1/edit
  def edit
    @admin_group = AdminGroup.find(params[:id])
  end

  # POST /admin_groups
  # POST /admin_groups.xml
  def create
    @admin_group = AdminGroup.new(params[:admin_group])

    respond_to do |format|
      if @admin_group.save
        format.html { redirect_to([:admin, @admin_group], :notice => 'Admin group was successfully created.') }
        format.xml  { render :xml => @admin_group, :status => :created, :location => @admin_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_groups/1
  # PUT /admin_groups/1.xml
  def update
    @admin_group = AdminGroup.find(params[:id])

    respond_to do |format|
      if @admin_group.update_attributes(params[:admin_group])
        format.html { redirect_to(@admin_group, :notice => 'Admin group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_groups/1
  # DELETE /admin_groups/1.xml
  def destroy
    @admin_group = AdminGroup.find(params[:id])
    @admin_group.destroy

    respond_to do |format|
      format.html { redirect_to(admin_groups_url) }
      format.xml  { head :ok }
    end
  end
end
