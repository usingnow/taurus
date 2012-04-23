class CreateSkuDisplays < ActiveRecord::Migration
  def change
    create_table :sku_displays do |t|
      t.integer :sku_id
      t.integer :sequence
      t.integer :page
      t.integer :location

      t.timestamps
    end
  end
end
