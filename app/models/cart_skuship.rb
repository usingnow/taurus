class CartSkuship < ActiveRecord::Base
  belongs_to :order
  belongs_to :sku
  belongs_to :cart

  def total_price
    sku.cost_aft_tax * quantity
  end
end
