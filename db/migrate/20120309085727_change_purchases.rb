class ChangePurchases < ActiveRecord::Migration
  def up
    rename_column :purchases, :number, :po_id
    add_column :purchases, :po_released_at, :datetime
    add_column :purchases, :po_closed_at, :datetime
    rename_column :purchases, :status, :po_status
    add_column :purchases, :po_store_status, :boolean
    add_column :purchases, :administrator_id, :integer
    rename_column :purchases, :note, :po_remarks
    rename_table :purchases, :purchase_orders

    add_index :purchase_orders, :ordering_company_id
    add_index :purchase_orders, :supplier_id
    add_index :purchase_orders, :administrator_id
  end

  def down
    rename_table :purchase_orders, :purchases
    rename_column :purchases, :po_id, :number
    remove_column :purchases, :po_released_at, :po_closed_at, :po_store_status, :administrator_id
    rename_column :purchases, :po_status, :status
    rename_column :purchases, :po_remarks, :note


    remove_index :purchases, :ordering_company_id
    remove_index :purchases, :supplier_id
    remove_index :purchases, :administrator_id
  end
end
