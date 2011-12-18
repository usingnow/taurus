class Cart < ActiveRecord::Base
  has_many :cart_skuships, :dependent => :destroy

  def add_sku(sku_id)
    current_sku = cart_skuships.find_by_sku_id(sku_id)
    if current_sku
     current_sku.quantity += 1
    else
      current_sku = cart_skuships.build(:sku_id => sku_id)
    end
    current_sku
  end

  def total_price
    cart_skuships.to_a.sum { |sku| sku.total_price }
  end

  def total_skus
    cart_skuships.sum(:quantity)
  end
end
