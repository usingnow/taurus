class Condition < ActiveRecord::Base
  scope :internal_operations, where(:condition_type => 1)
end
