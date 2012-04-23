class AddConditionTypeAndActionToCondition < ActiveRecord::Migration
  def self.up
    add_column :conditions, :condition_type, :integer
    add_column :conditions, :action, :string
  end

  def self.down
    remove_column :conditions, :condition_type, :action
  end
end
