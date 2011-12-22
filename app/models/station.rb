class Station < ActiveRecord::Base
  validates_presence_of :name, :display_name
  validates_numericality_of :sequence, :safe_quantity, :only_integer => true, :message => :not_an_integer
end
