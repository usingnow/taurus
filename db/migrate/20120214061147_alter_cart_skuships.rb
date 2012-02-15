class AlterCartSkuships < ActiveRecord::Migration
  def up
    add_column :cart_skuships, :is_need_install, :boolean
    add_column :cart_skuships, :is_need_assemble, :boolean
    remove_column :cart_skuships, :order_id
  end

  def down
    remove_column :cart_skuships, :is_need_install, :is_need_assemble
    add_column :cart_skuships, :order_id, :integer
  end
end
