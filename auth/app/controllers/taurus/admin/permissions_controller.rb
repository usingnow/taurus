module Taurus
  module Admin
	  class PermissionsController < BaseController

	    def index
	      @search = Group.search(params[:q])
	      @groups = @search.result.paginate(:page => params[:page], :per_page => 20)
	    end

	    def fun_edit
        @group = Group.find(params[:group_id])
        @functions = Function.all
	    end

	    def fun_update
        @group = Group.find(params[:group][:id])

        @group.fun_permissions.destroy_all

        params[:permission].each do |oper_id|
          @fun_permission = FunPermission.new(:operation_id => oper_id)
          Function.permissions(oper_id).each do |per|
            @fun_permission.permissions << Permission.new(:action_name => per["action_name"], :class_name => per["class_name"])
          end
          @group.fun_permissions << @fun_permission
        end if params[:permission]

        if @group.save
          flash[:success] = I18n.t('successfully_updated')
          redirect_to(fun_edit_admin_permissions_url(:group_id => @group))
        else
          render :action => :fun_edit
        end
	    end
      
	  end
  end
end