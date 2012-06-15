module Taurus
  module Admin
    class PersonExtendsController < BaseController

      def index
        params[:q] = { :user_status_eq => true } unless params[:q]
        @search = PersonExtend.search(params[:q])
        @person_extends = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        @person_extend = PersonExtend.new
        @person_extend.user = User.new
      end

      def create
        @person_extend = PersonExtend.new params[:person_extend]
        @person_extend.created_by = current_administrator.id
        if @person_extend.save
          flash[:success] = I18n.t(:successfully_created)
          redirect_to admin_person_extend_url(@person_extend)
        else
          render :action => "new"
        end
      end

      def edit
        @person_extend = PersonExtend.find(params[:id])
      end

      def update
        @person_extend = PersonExtend.find(params[:id])
        @person_extend.updated_by = current_administrator.id
        
        if @person_extend.update_attributes(params[:person_extend])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to admin_person_extend_url(@person_extend)
        else
          render :action => "edit"
        end
      end

      def show
        @person_extend = PersonExtend.find(params[:id])
      end

    end
  end
end  
