class AddSequenceAndLevelAndActiveToProductCategories < ActiveRecord::Migration
  def self.up
    add_column :product_categories, :sequence, :integer, :default => 0
    add_column :product_categories, :level, :integer, :default => 0
    add_column :product_categories, :active, :boolean, :default => false
  end

  def self.down
    remove_column :product_categories, :sequence
    remove_column :product_categories, :level
    remove_column :product_categories, :active
  end
end
