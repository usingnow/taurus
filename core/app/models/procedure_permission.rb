class ProcedurePermission < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :station
  belongs_to :condition
end
