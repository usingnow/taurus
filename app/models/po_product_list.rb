class PoProductList < ActiveRecord::Base
  belongs_to :product
  belongs_to :purchase_order

  def subtotal
    product_purchase_amount*product.cost_aft_tax
  end

end
