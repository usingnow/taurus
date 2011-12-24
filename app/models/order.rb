class Order < ActiveRecord::Base
  has_many :order_details, :dependent => :destroy
  belongs_to :instance, :dependent => :destroy

  def add_cart_skuships_from_cart(cart)
    cart.cart_skuships.each do |sku|
      sku.cart_id = nil
      cart_skuships << sku
    end
  end
end
