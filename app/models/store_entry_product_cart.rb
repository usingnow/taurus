class StoreEntryProductCart < ActiveRecord::Base
  belongs_to :product

  validates_numericality_of :quantity, :only_integer => true
  validates_numericality_of :unit_price_aft_tax, :total_amount
end
