class Procedure < ActiveRecord::Base
  has_many :station_procedureships

  validates :name, :display_name, :presence => true
  validates_numericality_of :sequence, :only_integer => true, :message => :not_an_integer
end
