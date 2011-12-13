class Admin::AdminsAdminGroupsController < ApplicationController

  def index
    @admin_groups = AdminGroup.all
    @admins_admin_groups = AdminAdminGroup.all
    print @admin_groups
    respond_to do |format|
      format.js  { render :json => @admin_groups, :layout => false }
    end
  end

  def create
    @admin_id = params[:admin_id]
    @admin_group_ids = params[:admin_group_ids]
    print @admin_id
    print @admin_group_ids
  end

end
