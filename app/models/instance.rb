class Instance < ActiveRecord::Base
  has_many :tracks, :dependent => :destroy
  belongs_to :procedure
  belongs_to :station


  def station_procedureships
    StationProcedureship.find_all_by_procedure_id_and_station_id(procedure_id,station_id)
  end
end
