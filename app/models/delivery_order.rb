class DeliveryOrder < ActiveRecord::Base
  belongs_to :store
  belongs_to :administrator
  validates_presence_of :store_id, :administrator_id
end
