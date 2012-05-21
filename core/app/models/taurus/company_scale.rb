module Taurus
	class CompanyScale < ActiveRecord::Base
		has_many :company_extends, :dependent => :destroy

		validates_presence_of :name
	end
end