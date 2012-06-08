#encoding:UTF-8
module Taurus
  module Admin
    class AdministratorGroupLineItemsController < BaseController
      def new
        @administrator = Administrator.find(params[:administrator_id])
        @groups = Group.all
      end

      def create
        @administrator = Administrator.find(params[:administrator_id])

        params[:group].each do |group_id|
          @administrator.administrator_group_line_items << AdministratorGroupLineItem.new(:group_id => group_id)
        end if params[:group]

        if @administrator.save
          flash[:success] = I18n.t('successfully_updated')
          redirect_to(admin_administrator_url(@administrator))
        else
          render :action => :new
        end
      end
    end
  end
end    