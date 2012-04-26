class Station < ActiveRecord::Base
  scope :user_stations, where("id > 4")
  scope :normal_stations, where(:station_type => 4)

  validates_presence_of :name, :display_name
  validates_numericality_of :sequence, :safe_quantity, :only_integer => true, :message => :not_an_integer


  def conditions(procedure_id)
    Condition.internal_operations.joins("inner join station_procedureships on conditions.id = station_procedureships.condition_id
                        and station_id = #{id} and procedure_id = #{procedure_id}")
  end
end
