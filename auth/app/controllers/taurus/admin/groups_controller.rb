module Taurus
  module Admin
    class GroupsController < BaseController

      def index
        @search = Group.search(params[:q])
        @groups = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @group = Group.find(params[:id])
      end

      def new
        @group = Group.new
      end

      def edit
        @group = Group.find(params[:id])
      end

      def create
        @group = Group.new params[:group]

        if @group.save
          flash[:success] = I18n.t('successfully_created')
          redirect_to admin_group_url(@group)
        else
          render "new"
        end
      end

      def update
        @group = Group.find(params[:id])

        if @group.update_attributes params[:group]
          flash[:success] = I18n.t('successfully_updated')
          redirect_to admin_group_url(@group)
        else
          render "edit"
        end
      end

      def destroy
        @group = Group.find(params[:id])

        if @group.destroy
          flash[:success] = I18n.t('successfully_destroyed')
        else
          flash[:error] = I18n.t('failure_destroyed')
        end

        redirect_to admin_groups_url
      end
    end
  end
end    