class DeliveryOrder < ActiveRecord::Base
  validates_presence_of :store_id, :administrator_id
end
