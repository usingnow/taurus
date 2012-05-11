module Taurus
  class Brand < ActiveRecord::Base
  	has_attached_file :image,
	                    :url  => "/taurus/brands/:id/:style/:basename.:extension",
	                    :path => ":rails_root/public/taurus/brands/:id/:style/:basename.:extension"

  	validates_presence_of :chinese_name, :english_name, :company_name, :created_by, :updated_by
  end
end