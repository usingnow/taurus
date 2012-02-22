class SkuOnShelf < ActiveRecord::Base
  belongs_to :sku

  validates_presence_of :sku_id, :status, :on_shelf_time, :off_shelf_time
end
