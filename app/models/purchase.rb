class Purchase < ActiveRecord::Base
  has_many :product_purchaseships, :dependent => :destroy
end
