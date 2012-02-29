class Content::AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
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
      redirect_to content_announcements_url
    else
      render "new"
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes params[:announcement]
      redirect_to content_announcements_url
    else
      render "edit"
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to content_announcements_url
  end
end