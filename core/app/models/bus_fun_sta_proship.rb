class BusFunStaProship < ActiveRecord::Base
  belongs_to :station_procedureship
  belongs_to :business_function
end
