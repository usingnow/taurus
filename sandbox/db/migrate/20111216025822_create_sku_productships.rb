class CreateSkuProductships < ActiveRecord::Migration
  def self.up
    create_table :sku_productships do |t|
      t.integer :sku_id
      t.integer :product_id
      t.string :package_name
      t.integer :package_num
      t.decimal :sales_bef_tax
      t.decimal :sales_aft_tax
      t.boolean :is_main
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :sku_productships
  end
end
