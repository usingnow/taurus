class AlterTableForBackOrderSkus < ActiveRecord::Migration
  def change
    add_column :back_order_skus, :is_need_install, :boolean, :default => false
    add_column :back_order_skus, :is_need_assemble, :boolean, :default => false
    add_index :back_order_skus, :sku_id
    add_index :back_order_skus, :user_id
  end
end
