class AddProcedureIdToOnlinePromotions < ActiveRecord::Migration
  def self.up
    add_column :online_promotions, :procedure_id, :integer
    add_index :online_promotions, :procedure_id
  end

  def self.down
    remove_index :online_promotions, :procedure_id
    remove_column :online_promotions, :procedure_id
  end
end
