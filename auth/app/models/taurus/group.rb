module Taurus
	class Group < ActiveRecord::Base
		
	  validates_presence_of :name
	end
end