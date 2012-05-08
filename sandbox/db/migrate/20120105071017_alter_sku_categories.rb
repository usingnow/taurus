class AlterSkuCategories < ActiveRecord::Migration
  def self.up
    add_column :sku_categories, :sequence, :integer
    add_column :sku_categories, :level, :integer
  end

  def self.down
    remove_column :sku_categories, :sequence
    remove_column :sku_categories, :level
  end
end
