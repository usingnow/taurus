class Procedure < ActiveRecord::Base
  has_many :station_procedureships

  def self.user_procedures(user_id)
    where("id in(select procedure_id from procedure_roleships where role_id in(select role_id from users where id = #{user_id}))")
  end

  validates :name, :display_name, :presence => true
  validates_numericality_of :sequence, :only_integer => true, :message => :not_an_integer
end
