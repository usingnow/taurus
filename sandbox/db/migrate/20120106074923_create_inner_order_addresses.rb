class CreateInnerOrderAddresses < ActiveRecord::Migration
  def self.up
    create_table :inner_order_addresses do |t|
      t.string :name
      t.string :district_no
      t.string :address
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :zip
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inner_order_addresses
  end
end
