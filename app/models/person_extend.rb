class PersonExtend < ActiveRecord::Base
  attr_accessor :email_confirmation

  validates :name, :presence => true
end
