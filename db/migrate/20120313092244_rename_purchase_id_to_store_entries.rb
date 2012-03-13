class RenamePurchaseIdToStoreEntries < ActiveRecord::Migration
  def up
    rename_column :store_entries, :purchase_id, :purchase_order_id
  end

  def down
    rename_column :store_entries, :purchase_order_id, :purchase_id
  end
end
