class AnnouncementsCell < BaseCell
  def display
    @announcements = Taurus::Announcement.display
    render  
  end
end