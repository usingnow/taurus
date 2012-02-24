class Role < ActiveRecord::Base
  has_many :procedure_roleships
  has_many :procedures, :through => :procedure_roleships
end
