class CreateTaurusCustomPropertyValues < ActiveRecord::Migration
  def change
    create_table :taurus_custom_property_values do |t|
      t.integer :product_id 
      t.integer :custom_property_id
      t.string :string_value
      t.text :text_value

      t.timestamps
    end
    add_index :taurus_custom_property_values, :product_id
    add_index :taurus_custom_property_values, :custom_property_id
  end

end
