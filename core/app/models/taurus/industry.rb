module Taurus
	class Industry < ActiveRecord::Base
	  validates_presence_of :name, :sequence
	end
end