class CreateTaurusProductDisplays < ActiveRecord::Migration
  def change
    create_table :taurus_product_displays do |t|
      t.integer :product_id
      t.integer :sequence, :default => 0

      t.timestamps
    end
    add_index :taurus_product_displays, :product_id
  end
end
