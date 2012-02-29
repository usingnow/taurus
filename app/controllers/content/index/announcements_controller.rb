class Content::Index::AnnouncementsController < ApplicationController
  layout "home"

  def show
    @announcement = Announcement.find(params[:id])
  end
end