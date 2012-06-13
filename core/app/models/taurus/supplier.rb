#encoding:UTF-8
module Taurus
	class Supplier < ActiveRecord::Base
		STATUS = { true => "激活", false => "未激活" }
		
		has_many :skus

		before_destroy :destroy_validate
		
		validates_presence_of :number, :name, :contact_name, :contact_phone, :created_by, :updated_by
		validates_uniqueness_of :number, :name


		protected
    def destroy_validate
      [:skus].map do |relation|
      	if self.send(relation).size > 0
          errors.add(:skus, '')
          return false 
        end
      end   
    end 
	end
end	
