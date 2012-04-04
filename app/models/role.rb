class Role < ActiveRecord::Base
  has_many :procedure_roleships
  has_many :procedures, :through => :procedure_roleships
  scope :reserved, where(:is_reserved => true)
end
