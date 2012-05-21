module Taurus
	class CompanyType < ActiveRecord::Base
		has_many :company_extends, :dependent => :destroy
		
		validates_presence_of :name, :sequence
	end
end	
