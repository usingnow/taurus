class CreateProductStoreEntryships < ActiveRecord::Migration
  def self.up
    create_table :product_store_entryships do |t|
      t.integer :store_entry_id
      t.integer :product_id
      t.integer :quantity, :default => 0
      t.date :delivery_date

      t.timestamps
    end
  end

  def self.down
    drop_table :product_store_entryships
  end
end
