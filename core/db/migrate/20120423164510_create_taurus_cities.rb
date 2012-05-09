class CreateTaurusCities < ActiveRecord::Migration
  def change
    create_table :taurus_cities do |t|
      t.integer :province_id
      t.string :name
      t.string :number
      t.decimal :free_shipping_limit, :precision => 8, :scale => 2
      t.decimal :shipping_fee, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :taurus_cities, :province_id
  end
end
