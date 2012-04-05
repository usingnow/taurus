class AddProductDiscountToPromotionByProducts < ActiveRecord::Migration
  def self.up
    add_column :promotion_by_products, :product_discount, :decimal, :precision => 8, :scale => 2, :default => 1.00
    remove_column :promotion_by_products, :promotion_method, :method_parameter
  end

  def self.down
    add_column :promotion_by_products, :promotion_method, :integer
    add_column :promotion_by_products, :method_parameter, :decimal, :precision => 8, :scale => 2, :default => 0.00
    remove_column :promotion_by_products, :product_discount
  end
end
