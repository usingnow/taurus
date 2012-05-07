module Taurus
	class CompanyType < ActiveRecord::Base
		validates_presence_of :name, :sequence
	end
end	
