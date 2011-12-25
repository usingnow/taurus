class User < ActiveRecord::Base
  has_one :person_extend

  attr_accessor :password_confirmation, :email_confirmation

  validates :login_no, :presence => true
end
