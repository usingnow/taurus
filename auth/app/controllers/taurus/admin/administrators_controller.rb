#encoding:UTF-8
module Taurus
  module Admin
    class AdministratorsController < BaseController
      helper 'taurus/administrators'

      def index
        @search = Administrator.search(params[:q])
        @search.sorts = "updated_at DESC"
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

        if @administrator.save
          flash[:success] = I18n.t('successfully_created')
          redirect_to(admin_administrator_url(@administrator))
        else
          render :action => "new"
        end
      end

      def update
        @administrator = Administrator.find(params[:id])

        if @administrator.update_attributes(params[:administrator])
          flash[:success] = I18n.t('successfully_updated')
          redirect_to(admin_administrator_url(@administrator))
        else
          render :action => "edit"
        end
      end

    end
  end
end    