class PersonExtend < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user

  attr_accessor :email_confirmation

  validates :name, :presence => true
  validates :email,:email => true

end
