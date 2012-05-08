class CreateProductCategories < ActiveRecord::Migration
  def self.up
    create_table :product_categories do |t|
      t.integer :parent_id
      t.string :number
      t.string :name
      t.text :description
      t.string :create_by
      t.string :update_by

      t.timestamps
    end
  end

  def self.down
    drop_table :product_categories
  end
end
