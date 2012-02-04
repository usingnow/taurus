#encoding:UTF-8
class PersonExtend < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  attr_accessor :email_confirmation

  validates_presence_of :name, :address ,:phone
  validates_presence_of :district_no ,:message => "请选择"
end
