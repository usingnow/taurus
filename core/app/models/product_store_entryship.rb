class ProductStoreEntryship < ActiveRecord::Base
  belongs_to :product
  belongs_to :store_entry

  def purchase_amount
    store_entry.purchase_order.po_product_lists.find_by_product_id(product_id).product_purchase_amount
  end
end
