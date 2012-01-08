class User < ActiveRecord::Base
  has_one :person_extend
  has_one :company_extend

  attr_accessor :password_confirmation, :email_confirmation

  validates_presence_of :login_no
end
