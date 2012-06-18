class CreateTaurusProductCategories < ActiveRecord::Migration
  def change
    create_table :taurus_product_categories do |t|
      t.integer :parent_id
      t.string :number
      t.string :name
      t.text :description
      t.integer :sequence, :default => 0
      t.boolean :status
      t.integer :category_type, :default => 0

      t.timestamps
    end
  end

end
