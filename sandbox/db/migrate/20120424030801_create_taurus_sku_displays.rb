class CreateTaurusSkuDisplays < ActiveRecord::Migration
  def change
    create_table :taurus_sku_displays do |t|
      t.references :sku
      t.integer :sequence
      t.integer :page
      t.integer :location

      t.timestamps
    end
    add_index :taurus_sku_displays, :sku_id
    add_index :taurus_sku_displays, :page
    add_index :taurus_sku_displays, :location
  end
end
