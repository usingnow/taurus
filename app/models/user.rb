class User < ActiveRecord::Base
  attr_accessor :password_confirmation, :email_confirmation

  validates :login_no, :presence => true
end
