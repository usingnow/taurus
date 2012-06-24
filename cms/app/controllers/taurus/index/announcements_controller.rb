module Taurus
  module Index
    class AnnouncementsController < Taurus::Index::BaseController

      def show
        @announcement = Announcement.find(params[:id])
      end

    end
  end
end