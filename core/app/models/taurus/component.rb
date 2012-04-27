module Taurus
	class Component < ActiveRecord::Base
	  has_many :functions
	end
end
