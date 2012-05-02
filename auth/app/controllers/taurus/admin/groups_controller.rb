module Taurus
  module Admin
    class GroupsController < BaseController
      #before_filter :authenticate_administrator!
      #authorize_resource

      def index
        @groups = Group.all
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
          redirect_to admin_groups_url
        else
          render "new"
        end
      end

      def update
        @group = Group.find(params[:id])

        if @group.update_attributes params[:group]
          redirect_to admin_groups_url
        else
          render "edit"
        end
      end

      def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to admin_groups_url
      end
    end
  end
end    