class CreateTaurusDistricts < ActiveRecord::Migration
  def change
    create_table :taurus_districts do |t|
      t.integer :city_id
      t.string :name
      t.string :number
      t.decimal :free_shipping_limit, :precision => 8, :scale => 2
      t.decimal :shipping_fee, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :taurus_districts, :city_id
  end
end
