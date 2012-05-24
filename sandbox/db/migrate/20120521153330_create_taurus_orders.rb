class CreateTaurusOrders < ActiveRecord::Migration
  def change
    create_table :taurus_orders do |t|
      t.string :number
      t.integer :user_id, :null => false
      t.string :customer_name
      t.decimal :total_payment, :precision => 8, :scale => 2, :default => 0
      t.string :state
      t.string :remarks_by_customer
      t.string :remarks_internal

      t.timestamps
    end

    add_index :taurus_orders, :user_id
  end

end
