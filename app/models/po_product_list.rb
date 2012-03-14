class PoProductList < ActiveRecord::Base
  belongs_to :product
  belongs_to :purchase_order

  def subtotal
    product_purchase_amount*product_unit_price
  end

  def store_amount
    purchase_order.store_entries.to_a.sum do |store_entry|
      store_entry.product_store_entryships.find_all_by_product_id(product_id).to_a.sum do |product|
        product.quantity
      end
    end
  end

  def store_price
    purchase_order.store_entries.to_a.sum do |store_entry|
      store_entry.product_store_entryships.find_all_by_product_id(product_id).to_a.sum do |product|
        product.quantity*product_unit_price
      end
    end
  end
end
