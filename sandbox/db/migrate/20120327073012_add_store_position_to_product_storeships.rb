class AddStorePositionToProductStoreships < ActiveRecord::Migration
  def change
    add_column :product_storeships, :store_position, :string
  end
end
