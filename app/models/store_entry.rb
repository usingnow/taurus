class StoreEntry < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :ordering_company
  belongs_to :supplier
  belongs_to :store
  validates_presence_of :ordering_company_id
end
