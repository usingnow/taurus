module Taurus
	class SliderBar < ActiveRecord::Base
	  has_attached_file :image,
	                    :url  => "/taurus/slider_bars/:id/:style/:basename.:extension",
	                    :path => ":rails_root/public/taurus/slider_bars/:id/:style/:basename.:extension",
	                    :styles => { :normal => "770x430#", :small => "77x43#" }

	  scope :display, limit(5)

	  validates_presence_of :name, :image_file_name
	  validates_attachment_presence :image
	end
end

