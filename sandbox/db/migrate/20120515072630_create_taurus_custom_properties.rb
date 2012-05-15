class CreateTaurusCustomProperties < ActiveRecord::Migration
  def change
    create_table :taurus_custom_properties do |t|
      t.integer :product_category_id
      t.string :name
      t.integer :property_type, :default => 0
      t.string :remarks
      t.boolean :status 

      t.timestamps
    end
  end

end
