#encoding:UTF-8
module Taurus
  class CompanyExtend < ActiveRecord::Base
    has_one :user, :as => :userable, :dependent => :destroy
    accepts_nested_attributes_for :user
    belongs_to :industry
    belongs_to :company_type
    belongs_to :company_scale
    belongs_to :district
    
    before_create :insert_number

    SEX = { 0 => "女士", 1 => "先生" }

    validates_presence_of :name, :contact_name
    validates_uniqueness_of :name
    validate :phone_or_mobile

    protected
    def phone_or_mobile
      errors.add(:phone, :phone_or_mobile) if phone.blank? && contact_mobile.blank?
    end

    def insert_number
	  last = CompanyExtend.last
	  self.number = "U" + (last ? (last.number[1,7].to_i+1).to_s.rjust(6,"0") : "000001")
    end 	
  end
end
