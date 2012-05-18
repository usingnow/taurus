#encoding:UTF-8
module Taurus
  module Admin
    class AdministratorsController < BaseController
      helper 'taurus/administrators'

      def index
        @search = Administrator.search(params[:q])
        @administrators = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @administrator = Administrator.find(params[:id])
      end

      def new
        @administrator = Administrator.new
      end

      def edit
        @administrator = Administrator.find(params[:id])
      end

      def create
        @administrator = Administrator.new(params[:administrator])

        respond_to do |format|
          if @administrator.save
            format.html { redirect_to(admin_administrators_url, :notice => 'Admin was successfully created.') }
            format.xml  { render :xml => @administrator, :status => :created, :location => @administrator }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @administrator.errors, :status => :unprocessable_entity }
          end
        end
      end

      # PUT /admins/1
      # PUT /admins/1.xml
      def update
        @administrator = Administrator.find(params[:id])

        respond_to do |format|
          if @administrator.update_attributes(params[:administrator])
            format.html { redirect_to(admin_administrators_url, :notice => 'Admin was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @administrator.errors, :status => :unprocessable_entity }
          end
        end
      end

      # DELETE /admins/1
      # DELETE /admins/1.xml
      def destroy
        @admin = Admin.find(params[:id])
        @admin.destroy

        respond_to do |format|
          format.html { redirect_to(admin_admins_url) }
          format.xml  { head :ok }
        end
      end
    end
  end
end    