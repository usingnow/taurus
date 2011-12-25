class Instance < ActiveRecord::Base
  has_many :tracks, :dependent => :destroy
  belongs_to :procedure
  belongs_to :station
end
