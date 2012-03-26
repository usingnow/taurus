class Group < ActiveRecord::Base
  validates_presence_of :number, :name
  has_many :permissions
  has_many :operatings, :through => :permissions
  has_many :procedure_permissions
end
