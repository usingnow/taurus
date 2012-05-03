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

        respond_to do |format|
          if @role.save
            format.html { redirect_to([:admin,@role], :notice => 'Role was successfully created.') }
          else
            format.html { render :action => "new" }
          end
        end
      end

      # PUT /roles/1
      # PUT /roles/1.xml
      def update
        @role = Role.find(params[:id])

        respond_to do |format|
          if @role.update_attributes(params[:role])
            format.html { redirect_to([:admin,@role], :notice => 'Role was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
          end
        end
      end
    end
  end
end