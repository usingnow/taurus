module Taurus
	class Group < ActiveRecord::Base
		has_many :fun_permissions
		
	  validates_presence_of :name
	end
end