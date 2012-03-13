class PoProductTempList < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def subtotal
    product_purchase_amount*product.cost_aft_tax
  end
end
