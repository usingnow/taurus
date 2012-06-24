module Taurus
  module Admin
    class AnnouncementsController < BaseController

      def index
        @search = Announcement.search(params[:q])
        @announcements = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @announcement = Announcement.find(params[:id])
      end

      def new
        @announcement = Announcement.new
      end

      def create
        @announcement = Announcement.new params[:announcement]
        
        if @announcement.save
          flash[:success] = I18n.t('successfully_created')
          redirect_to admin_announcement_url(@announcement)
        else
          render "new"
        end
      end

      def edit
        @announcement = Announcement.find(params[:id])
      end

      def update
        @announcement = Taurus::Announcement.find(params[:id])

        if @announcement.update_attributes params[:announcement]
          flash[:success] = I18n.t('successfully_updated')
          redirect_to admin_announcement_url(@announcement)
        else
          render "edit"
        end
      end

      def destroy
        @announcement = Announcement.find(params[:id])
        
        if @announcement.destroy
          flash[:success] = I18n.t('successfully_destroyed')  
        else
          flash[:success] = I18n.t('failure_destroyed')  
        end  

        redirect_to admin_announcements_url
      end
    end
  end
end