class CreateTaurusOrderDeliveries < ActiveRecord::Migration
  def change
    create_table :taurus_order_deliveries do |t|
      t.integer :order_id, :null => false
      t.decimal :shipping_standard_cost, :precision => 8, :scale => 2, :default => 0
      t.decimal :shipping_cost, :precision => 8, :scale => 2, :default => 0
      t.string :attention
      t.integer :district_id, :null => false
      t.string :address
      t.string :telephone
      t.string :mobile

      t.timestamps
    end

    add_index :taurus_order_deliveries, :order_id
    add_index :taurus_order_deliveries, :district_id
  end

end
