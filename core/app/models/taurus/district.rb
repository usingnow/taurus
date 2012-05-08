module Taurus
	class District < ActiveRecord::Base
	  belongs_to :city
	end
end