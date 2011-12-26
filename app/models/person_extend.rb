class PersonExtend < ActiveRecord::Base
  belongs_to :user

  attr_accessor :email_confirmation

  validates :name, :presence => true
end
