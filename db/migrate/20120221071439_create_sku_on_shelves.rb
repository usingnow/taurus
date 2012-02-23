class CreateSkuOnShelves < ActiveRecord::Migration
  def change
    create_table :sku_on_shelves do |t|
      t.integer :sku_id
      t.datetime :on_shelf_time
      t.datetime :off_shelf_time
      t.string :off_shelf_description
      t.integer :status

      t.timestamps
    end
  end
end
