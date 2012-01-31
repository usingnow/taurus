class CompanyExtend < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :industry
  belongs_to :company_type
  belongs_to :company_scale
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"


  attr_accessor :email_confirmation

  validates_presence_of :company_name, :district_no, :email, :name
  validates_uniqueness_of :company_name
end
