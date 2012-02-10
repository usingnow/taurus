class Content::AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new params[:announcement]
    @announcement.save
    redirect_to content_announcements_url
  end
end