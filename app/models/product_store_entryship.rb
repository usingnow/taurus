class ProductStoreEntryship < ActiveRecord::Base
  belongs_to :product
  belongs_to :store_entry
end
