class CartSkuship < ActiveRecord::Base
  belongs_to :order
  belongs_to :sku
  belongs_to :cart

  def total_amount
    sku.cost_aft_tax * quantity + sku.insatllation_cost_aft_tax + sku.assembling_fee_aft_tax
  end
end
