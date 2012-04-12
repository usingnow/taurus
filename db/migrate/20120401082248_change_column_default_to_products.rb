class ChangeColumnDefaultToProducts < ActiveRecord::Migration
  def up
    change_column_default :products, :cost_bef_tax, 0.00
    change_column_default :products, :cost_aft_tax, 0.00
    change_column_default :products, :assembling_fee_bef_tax, 0.00
    change_column_default :products, :assembling_fee_aft_tax, 0.00
    change_column_default :products, :maintenance_cost_bef_tax, 0.00
    change_column_default :products, :maintenance_cost_aft_tax, 0.00
    change_column_default :products, :installation_cost_bef_tax, 0.00
    change_column_default :products, :insatllation_cost_aft_tax, 0.00
    execute "update products set cost_bef_tax = 0 where cost_bef_tax is null;"
    execute "update products set cost_aft_tax = 0 where cost_aft_tax is null;"
    execute "update products set assembling_fee_bef_tax = 0 where assembling_fee_bef_tax is null;"
    execute "update products set assembling_fee_aft_tax = 0 where assembling_fee_aft_tax is null;"
    execute "update products set maintenance_cost_bef_tax = 0 where maintenance_cost_bef_tax is null;"
    execute "update products set maintenance_cost_aft_tax = 0 where maintenance_cost_aft_tax is null;"
    execute "update products set installation_cost_bef_tax = 0 where installation_cost_bef_tax is null;"
    execute "update products set insatllation_cost_aft_tax = 0 where insatllation_cost_aft_tax is null;"
  end

  def down
    change_column_default :products, :cost_bef_tax, nil
    change_column_default :products, :cost_aft_tax, nil
    change_column_default :products, :assembling_fee_bef_tax, nil
    change_column_default :products, :assembling_fee_aft_tax, nil
    change_column_default :products, :maintenance_cost_bef_tax, nil
    change_column_default :products, :maintenance_cost_aft_tax, nil
    change_column_default :products, :installation_cost_bef_tax, nil
    change_column_default :products, :insatllation_cost_aft_tax, nil
  end
end
