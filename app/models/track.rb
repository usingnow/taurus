class Track < ActiveRecord::Base
  belongs_to :condition
  belongs_to :station, :class_name => "Station", :foreign_key => "station_id"
  belongs_to :next_station, :class_name => "Station", :foreign_key => "next_station_id"
end
