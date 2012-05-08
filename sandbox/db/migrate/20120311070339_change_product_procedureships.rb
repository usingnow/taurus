class ChangeProductProcedureships < ActiveRecord::Migration
  def up
    rename_column :product_purchaseships, :purchase_id, :purchase_order_id

    change_column :product_purchaseships, :unit_price_aft_tax, :decimal, :precision => 8, :scale => 2, :default => 0.00
    rename_column :product_purchaseships, :unit_price_aft_tax, :product_unit_price

    change_column_default :product_purchaseships, :quantity, 0
    rename_column :product_purchaseships, :quantity, :product_purchase_amount

    add_column :product_purchaseships, :product_received, :integer, :default => 0

    remove_column :product_purchaseships, :total_amount, :delivery_date

    add_index :product_purchaseships, :purchase_order_id
    add_index :product_purchaseships, :product_id

    rename_table :product_purchaseships, :po_product_lists
  end

  def down
    rename_table :po_product_lists, :product_purchaseships

    rename_column :product_purchaseships, :purchase_order_id, :purchase_id

    rename_column :product_purchaseships, :product_unit_price, :unit_price_aft_tax
    change_column :product_purchaseships, :unit_price_aft_tax, :decimal, :precision => 10, :scale => 0

    rename_column :product_purchaseships, :product_purchase_amount, :quantity
    change_column_default :product_purchaseships, :quantity, nil

    remove_column :product_purchaseships, :product_received

    add_column :product_purchaseships, :total_amount, :decimal
    add_column :product_purchaseships, :delivery_date, :datetime

    remove_index :product_purchaseships, :purchase_order_id
    remove_index :product_purchaseships, :product_id
  end
end
