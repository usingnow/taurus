class Group < ActiveRecord::Base
  validates_presence_of :number, :name
end
