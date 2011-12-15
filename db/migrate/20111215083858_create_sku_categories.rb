class CreateSkuCategories < ActiveRecord::Migration
  def self.up
    create_table :sku_categories do |t|
      t.integer :root_id
      t.integer :parent_id
      t.string :number
      t.string :name
      t.text :description
      t.boolean :is_show_in_navigation
      t.boolean :is_show_in_column
      t.boolean :active
      t.string :create_by
      t.string :update_by

      t.timestamps
    end
  end

  def self.down
    drop_table :sku_categories
  end
end
