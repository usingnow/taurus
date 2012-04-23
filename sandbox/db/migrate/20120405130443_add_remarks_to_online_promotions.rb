class AddRemarksToOnlinePromotions < ActiveRecord::Migration
  def change
    add_column :online_promotions, :remarks, :text
    add_column :online_promotions, :administrator_id, :integer
    add_index :online_promotions, :administrator_id
  end
end
