class AlterSkus < ActiveRecord::Migration
  def up
    rename_column :skus, :insatllation_cost_aft_tax, :installation_cost_aft_tax
  end

  def down
    rename_column :skus, :installation_cost_aft_tax, :insatllation_cost_aft_tax
  end
end
