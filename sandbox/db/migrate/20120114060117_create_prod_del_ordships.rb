class CreateProdDelOrdships < ActiveRecord::Migration
  def self.up
    create_table :prod_del_ordships do |t|
      t.integer :delivery_order_id
      t.integer :product_id
      t.integer :quantity, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :prod_del_ordships
  end
end
