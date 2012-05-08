class CreatePromotionProductTemps < ActiveRecord::Migration
  def change
    create_table :promotion_product_temps do |t|
      t.integer :products_selection
      t.integer :selection_parameter
      t.integer :administrator_id

      t.timestamps
    end
    add_index :promotion_product_temps, :selection_parameter
    add_index :promotion_product_temps, :administrator_id
  end
end
