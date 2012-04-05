class CreatePromotionByProducts < ActiveRecord::Migration
  def change
    create_table :promotion_by_products do |t|
      t.integer :products_selection, :default => 0
      t.integer :selection_parameter
      t.integer :promotion_basis, :default => 0
      t.integer :basis_parameter, :default => 0
      t.integer :promotion_method
      t.decimal :method_parameter, :precision => 8, :scale => 2, :default => 0.00

      t.timestamps
    end
  end
end
