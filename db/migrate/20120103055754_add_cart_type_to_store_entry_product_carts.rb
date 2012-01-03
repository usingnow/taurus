class AddCartTypeToStoreEntryProductCarts < ActiveRecord::Migration
  def self.up
    add_column :store_entry_product_carts, :cart_type, :integer
  end

  def self.down
    remove_column :store_entry_product_carts, :cart_type
  end
end
