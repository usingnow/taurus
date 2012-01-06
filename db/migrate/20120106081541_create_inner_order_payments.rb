class CreateInnerOrderPayments < ActiveRecord::Migration
  def self.up
    create_table :inner_order_payments do |t|
      t.integer :procedure_id
      t.integer :invoice_type
      t.string :account_bank
      t.string :account_person_name
      t.string :account_phone
      t.string :account_no
      t.string :added_value_tax_no
      t.string :account_reg_add
      t.integer :is_invoice_head
      t.string :company_name
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inner_order_payments
  end
end
