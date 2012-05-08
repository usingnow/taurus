class Procedure < ActiveRecord::Base
  has_many :station_procedureships

  scope :activated, where(:active => true)

  def self.user_procedures(user_id)
    where("id in(select procedure_id from procedure_roleships where role_id in(select role_id from users where id = #{user_id}))")
  end

  def stations
    Station.find_by_sql("SELECT `stations`.* FROM `stations` INNER JOIN `station_procedureships` ON
                         `stations`.`id` = `station_procedureships`.`next_station_id` WHERE
                         `station_procedureships`.`procedure_id` = #{id} AND (station_type in(1,2,4)) GROUP BY id")
  end


  validates :name, :display_name, :presence => true
  validates_numericality_of :sequence, :only_integer => true, :message => :not_an_integer
end
