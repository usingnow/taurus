class Procedure < ActiveRecord::Base
  has_many :station_procedureships
  has_many :stations, :through => :station_procedureships
  scope :activated, where(:active => true)

  def self.user_procedures(user_id)
    where("id in(select procedure_id from procedure_roleships where role_id in(select role_id from users where id = #{user_id}))")
  end

  def normal_stations
    stations.normal_stations.group(:id)
  end

  validates :name, :display_name, :presence => true
  validates_numericality_of :sequence, :only_integer => true, :message => :not_an_integer
end
