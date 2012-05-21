class CreateTaurusOrderPayments < ActiveRecord::Migration
  def change
    create_table :taurus_order_payments do |t|
      t.integer :order_id, :null => false
      t.boolean :payment_status
      t.integer :payment_method_id, :null => false
      t.integer :receipt_type, :default => 0
      t.string :receipt_title
      t.string :bank_name
      t.string :company_name
      t.string :bank_account
      t.string :vat_number
      t.string :registered_telephone
      t.string :registered_address

      t.timestamps
    end

    add_index :taurus_order_payments, :order_id
    add_index :taurus_order_payments, :payment_method_id
  end

end
