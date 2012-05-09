module Taurus
  module Admin
    class CompanyExtendsController < BaseController
      #before_filter :authenticate_administrator!
      #authorize_resource

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

      def edit
        @company_extend = CompanyExtend.find(params[:id])
      end

      def create
        @company_extend = CompanyExtend.new params[:company_extend]

        if @company_extend.save
          redirect_to admin_company_extends_url
        else
          render :action => "new"
        end
      end

      def update
        @company_extend = CompanyExtend.find(params[:id])

        if @company_extend.update_attributes(params[:company_extend])
          redirect_to admin_company_extends_path
        else
          render :action => "edit"
        end
      end
    end
  end
end