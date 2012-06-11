module Taurus
  module Admin
    class SuppliersController < BaseController

      def index
        params[:q] = { :status_eq => true } unless params[:q]
        @search = Supplier.search(params[:q])
        @suppliers = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @supplier = Supplier.find(params[:id])
      end

      def new
        @supplier = Supplier.new
      end

      def edit
        @supplier = Supplier.find(params[:id])
      end

      def create
        @supplier            = Supplier.new(params[:supplier])
        @supplier.created_by = current_administrator.id
        @supplier.updated_by = current_administrator.id

        if @supplier.save
          redirect_to admin_suppliers_url
        else
          render :action => "new"
        end
      end

      def update
        @supplier            = Supplier.find(params[:id])
        @supplier.updated_by = current_administrator.id

        if @supplier.update_attributes(params[:supplier])
          redirect_to admin_suppliers_url
        else
          render :action => "edit"
        end
      end

      def destroy
        @supplier = Supplier.find(params[:id])
        @supplier.destroy

        redirect_to(admin_suppliers_url) 
      end
    end
  end
end    
