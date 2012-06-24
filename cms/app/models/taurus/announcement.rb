module Taurus	
  class Announcement < ActiveRecord::Base
    validates_presence_of :title, :internal_title, :description

    scope :display, order("created_at DESC")
  end
end  
