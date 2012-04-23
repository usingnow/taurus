module Taurus
	class SliderBar < ActiveRecord::Base
	  has_attached_file :image,
	                    :url  => "/taurus/slider_bars/:id/:style/:basename.:extension",
	                    :path => ":rails_root/public/taurus/slider_bars/:id/:style/:basename.:extension"
	end
end

