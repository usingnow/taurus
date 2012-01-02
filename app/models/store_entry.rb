class StoreEntry < ActiveRecord::Base
  validates_presence_of :ordering_company_id
end
