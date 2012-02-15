class CartSkuship < ActiveRecord::Base
  belongs_to :order
  belongs_to :sku
  belongs_to :cart

  def total_amount
    amount = sku.cost_aft_tax * quantity
    if is_need_install?
      amount += sku.installation_cost_aft_tax
    end
    if is_need_assemble?
      amount += sku.assembling_fee_aft_tax
    end
    amount
  end
end
