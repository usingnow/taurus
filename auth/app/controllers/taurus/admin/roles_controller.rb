module Taurus
  module Admin
    class RolesController < BaseController
      #before_filter :authenticate_administrator!
      #authorize_resource

      def index
        @search = Role.search(params[:q])
        @roles = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @role = Role.find(params[:id])
      end

      # GET /roles/new
      # GET /roles/new.xml
      def new
        @role = Role.new
      end

      # GET /roles/1/edit
      def edit
        @role = Role.find(params[:id])
      end

      # POST /roles
      # POST /roles.xml
      def create
        @role = Role.new(params[:role])

        if @role.save
          redirect_to admin_roles_url
        else
          render :action => "new"
        end
      end

      # PUT /roles/1
      # PUT /roles/1.xml
      def update
        @role = Role.find(params[:id])

        if @role.update_attributes(params[:role])
          redirect_to admin_roles_url
        else
          render :action => "edit"
        end
      end
    end
  end
end