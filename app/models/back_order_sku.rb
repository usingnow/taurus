class BackOrderSku < ActiveRecord::Base
  belongs_to :sku
  belongs_to :user

  def subtotal
    sku.cost_aft_tax*quantity +
    (is_need_install ? sku.installation_cost_aft_tax : 0) +
    (is_need_assemble ? sku.assembling_fee_aft_tax : 0)
  end

  validates_presence_of :sku_id, :user_id
end
