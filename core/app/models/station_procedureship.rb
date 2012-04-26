class StationProcedureship < ActiveRecord::Base
  belongs_to :station, :class_name => "Station", :foreign_key => "station_id"
  belongs_to :next_station, :class_name => "Station", :foreign_key => "next_station_id"
  belongs_to :condition
  belongs_to :business_function
  belongs_to :order_oper_url
  has_many :bus_fun_sta_proships
  has_many :business_functions, :through => :bus_fun_sta_proships

  attr_accessor :name
  validates_numericality_of :sequence, :sub_sequence, :only_integer => true, :message => :not_an_integer


end
