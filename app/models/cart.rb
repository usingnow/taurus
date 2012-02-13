class Cart < ActiveRecord::Base
  has_many :cart_skuships, :dependent => :destroy

  def add_sku(sku_id,quantity)
    current_cart_sku = cart_skuships.find_by_sku_id(sku_id)
    if current_cart_sku
     current_cart_sku.quantity += quantity.to_i
    else
      current_cart_sku = cart_skuships.build(:sku_id => sku_id)
    end
    current_cart_sku
  end


  def total_items
    cart_skuships.sum(:quantity)
  end
end
