class CreateProductStoreships < ActiveRecord::Migration
  def self.up
    create_table :product_storeships do |t|
      t.integer :store_id
      t.integer :product_id
      t.integer :quantity
      t.integer :stockout

      t.timestamps
    end
  end

  def self.down
    drop_table :product_storeships
  end
end
