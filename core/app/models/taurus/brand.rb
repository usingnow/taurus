#encoding:UTF-8
module Taurus
  class Brand < ActiveRecord::Base
    STATUS = { true => "激活", false => "未激活" }
    
  	has_attached_file :image,
	                    :url  => "/taurus/brands/:id/:style/:basename.:extension",
	                    :path => ":rails_root/public/taurus/brands/:id/:style/:basename.:extension",
	                    :styles => { :logo => "100x40#" }
	  has_many :skus

	  before_destroy :destroy_validate                  

  	validates_presence_of :chinese_name, :english_name, :company_name, :created_by, :updated_by
 
    protected
	    def destroy_validate
	      [:skus].map do |relation|
	        return false if self.send(relation).size > 0
	      end   
	    end
  end
end