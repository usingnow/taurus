#encoding:UTF-8
module Taurus
	class Supplier < ActiveRecord::Base
		has_many :skus, :dependent => :destroy
		
		validates_presence_of :number, :name, :contact_name, :contact_phone, :created_by, :updated_by
		validates_uniqueness_of :number, :name
	end
end	
