class CreateSkuBrowsingHistories < ActiveRecord::Migration
  def change
    create_table :sku_browsing_histories do |t|
      t.integer :user_id
      t.integer :sku_id
      t.integer :quantity, :default => 1

      t.timestamps
    end
  end
end
