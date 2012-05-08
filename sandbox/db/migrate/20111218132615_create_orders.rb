class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :number
      t.string :batch
      t.datetime :expect_date
      t.integer :instance_id
      t.integer :user_id
      t.integer :take_admin_id
      t.integer :created_admin_id
      t.integer :updated_admin_id
      t.text :customer_note
      t.text :inner_note
      t.string :reserve_reason
      t.decimal :other_cost, :precision => 8, :scale => 2
      t.integer :is_affect_details
      t.string :district_no
      t.string :name
      t.string :address
      t.string :zip
      t.string :phone
      t.string :mobile
      t.string :email
      t.decimal :carriage_cost, :precision => 8, :scale => 2
      t.integer :invoice_type
      t.string :account_bank
      t.string :account_person_name
      t.string :account_no
      t.string :account_phone
      t.string :added_value_tax_no
      t.string :account_reg_add
      t.integer :is_invoice_head
      t.string :company_name

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
