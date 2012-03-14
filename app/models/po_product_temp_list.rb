class PoProductTempList < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates_numericality_of :product_purchase_amount, :only_integer => true, :greater_than => 0

  def subtotal
    product_purchase_amount*product.cost_aft_tax
  end
end
