class OrderPrintLog < ActiveRecord::Base
  belongs_to :order
  belongs_to :administrator

  validates_presence_of :order_id, :administrator_id
end
