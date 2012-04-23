class Announcement < ActiveRecord::Base
  validates_presence_of :title, :internal_title, :description
end
