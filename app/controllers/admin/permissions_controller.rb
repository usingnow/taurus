class Admin::PermissionsController < ApplicationController
  before_filter :authenticate_administrator!

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

  def procedure_new
    @group = Group.find(params[:id])
    @procedures = Procedure.activated
    authorize! :procedure_create, Permission
  end

  def procedure_create
    authorize! :procedure_create, Permission
    permissions = params[:permission]

    @group = Group.find(params[:id])
    ProcedurePermission.transaction do
      ProcedurePermission.destroy_all(:group_id => params[:id])
      if permissions
        permissions.each do |permission|
          @group.procedure_permissions <<
            ProcedurePermission.new(:condition_id => eval(permission)[:condition_id], :procedure_id => eval(permission)[:procedure_id],
                                    :station_id => eval(permission)[:station_id])
        end
        @group.save
      end
    end

    redirect_to admin_permissions_url
  end
end
