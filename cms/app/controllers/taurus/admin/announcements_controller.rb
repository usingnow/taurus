module Taurus
  module Admin
    class AnnouncementsController < BaseController
      before_filter :authenticate_administrator!
      #authorize_resource

      def index
        @announcements = Taurus::Announcement.all
      end

      def show
        @announcement = Taurus::Announcement.find(params[:id])
      end

      def new
        @announcement = Taurus::Announcement.new
      end

      def create
        @announcement = Taurus::Announcement.new params[:announcement]
        if @announcement.save
          redirect_to admin_announcements_url
        else
          render "new"
        end
      end

      def edit
        @announcement = Taurus::Announcement.find(params[:id])
      end

      def update
        @announcement = Taurus::Announcement.find(params[:id])
        if @announcement.update_attributes params[:announcement]
          redirect_to admin_announcements_url
        else
          render "edit"
        end
      end

      def destroy
        @announcement = Taurus::Announcement.find(params[:id])
        @announcement.destroy
        redirect_to admin_announcements_url
      end
    end
  end
end