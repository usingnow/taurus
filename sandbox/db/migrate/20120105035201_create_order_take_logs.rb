class CreateOrderTakeLogs < ActiveRecord::Migration
  def self.up
    create_table :order_take_logs do |t|
      t.integer :order_id
      t.integer :oper_type
      t.string :created_by
      t.integer :admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :order_take_logs
  end
end
