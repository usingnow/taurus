class StoreEntry < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :ordering_company
  belongs_to :supplier
  belongs_to :store
  has_many :product_store_entryships
  validates_presence_of :ordering_company_id
end
