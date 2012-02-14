class Cart < ActiveRecord::Base
  has_many :cart_skuships, :dependent => :destroy

  def add_sku(sku_id,quantity)
    current_cart_sku = cart_skuships.find_by_sku_id(sku_id)
    if current_cart_sku
     current_cart_sku.quantity += quantity.to_i
    else
      current_cart_sku = cart_skuships.build(:sku_id => sku_id, :is_need_install => 0, :is_need_assemble => 0)
    end
    current_cart_sku
  end


  def total_items
    cart_skuships.sum(:quantity)
  end

  def total_sku_amount
    cart_skuships.to_a.sum { |cart_sku| cart_sku.quantity * cart_sku.sku.cost_aft_tax }
  end

  def total_installation_amount
    cart_skuships.where("is_need_install = 1").to_a.sum do |cart_sku|
      cart_sku.sku.installation_cost_aft_tax
    end
  end

  def total_assembling_amount
    cart_skuships.where("is_need_assemble = 1").to_a.sum do |cart_sku|
      cart_sku.sku.assembling_fee_aft_tax
    end
  end

  def total_amount
    total_sku_amount + total_installation_amount + total_assembling_amount
  end


end
