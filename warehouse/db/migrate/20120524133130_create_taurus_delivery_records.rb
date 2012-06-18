class CreateTaurusDeliveryRecords < ActiveRecord::Migration
  def change
    create_table :taurus_delivery_records do |t|
      t.string :number
      t.integer :order_id
      t.integer :delivery_record_type, :default => 9
      t.integer :delivery_type, :default => 0
      t.string :delivery_name
      t.date :delivery_date
      t.string :courier
      t.string :courier_number
      t.string :customer_name
      t.string :customer_phone
      t.date :pick_up_date
      t.string :remarks
      t.integer :administrator_id, :null => false


      t.timestamps
    end
    add_index :taurus_delivery_records, :number, :unique => true
    add_index :taurus_delivery_records, :order_id
    add_index :taurus_delivery_records, :administrator_id
  end
end
