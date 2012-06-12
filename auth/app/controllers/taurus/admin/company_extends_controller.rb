module Taurus
  module Admin
    class CompanyExtendsController < BaseController

      def index
        @search = CompanyExtend.search(params[:q])
        @company_extends = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @company_extend = CompanyExtend.find(params[:id])
      end

      def new
        @company_extend = CompanyExtend.new
        @company_extend.user = User.new
      end

      def create
        @company_extend = CompanyExtend.new params[:company_extend]
        @company_extend.created_by = current_administrator.id

        if @company_extend.save
          flash[:success] = I18n.t(:successfully_created)
          redirect_to admin_company_extend_url(@company_extend)
        else
          render :action => "new"
        end
      end

      def edit
        @company_extend = CompanyExtend.find(params[:id])
      end

      def update
        @company_extend = CompanyExtend.find(params[:id])
        @company_extend.updated_by = current_administrator.id

        if @company_extend.update_attributes(params[:company_extend])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to admin_company_extend_url(@company_extend)
        else
          render :action => "edit"
        end
      end
    end
  end
end