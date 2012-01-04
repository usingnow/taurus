class Purchase < ActiveRecord::Base
  has_many :product_purchaseships, :dependent => :destroy
  belongs_to :ordering_company
  belongs_to :supplier
end
