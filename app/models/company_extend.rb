class CompanyExtend < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  attr_accessor :email_confirmation

  validates_presence_of :company_name
end
