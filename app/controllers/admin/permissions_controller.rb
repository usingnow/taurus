class Admin::PermissionsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def index
    @groups = Group.all
  end

  def new
    @permissions = Permission.find_all_by_group_id(params[:group_id])
    @group = Group.find(params[:group_id])
    @systems = System.all
  end

  def create
    oper_ids = params[:permission]
    group_id = params[:group_id]

    Permission.destroy_all(:group_id => group_id)

    line_itmes = []
    unless oper_ids.nil?
      oper_ids.each do |oper_id|
        line_itmes << {:group_id => group_id, :operating_id => oper_id}
      end
    end

    Permission.create(line_itmes)

    redirect_to admin_permissions_url
  end
end
