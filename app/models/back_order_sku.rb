class BackOrderSku < ActiveRecord::Base
  belongs_to :sku
  belongs_to :user

  def subtotal
    sku.cost_aft_tax*quantity+sku.installation_cost_aft_tax+sku.assembling_fee_aft_tax
  end

  validates_presence_of :sku_id, :user_id
end
