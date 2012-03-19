class DeliveryOrder < ActiveRecord::Base
  belongs_to :store
  belongs_to :administrator
  belongs_to :order
  has_many :prod_del_ordships

  validates_presence_of :store_id, :administrator_id, :name, :line_type
end
