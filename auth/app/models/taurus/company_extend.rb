#encoding:UTF-8
module Taurus
  class CompanyExtend < ActiveRecord::Base
    has_one :user, :as => :taurus_userable, :dependent => :destroy
    accepts_nested_attributes_for :user
    belongs_to :industry
    belongs_to :company_type
    belongs_to :company_scale
    belongs_to :district
    before_create :insert_number

    SEX = { 0 => "女", 1 => "男" }

    validates_presence_of :name, :district_id, :contact_name, :industry_id, :company_type_id, :created_by
    validates_presence_of :updated_by, :on => :update
    validates_uniqueness_of :name

    protected
    def insert_number
	  last = CompanyExtend.last
	  self.number = "U" + (last ? (last.number[1,7].to_i+1).to_s.rjust(6,"0") : "000001")
    end 	
  end
end
