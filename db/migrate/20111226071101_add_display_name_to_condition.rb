class AddDisplayNameToCondition < ActiveRecord::Migration
  def self.up
    add_column :conditions, :display_name, :string
  end

  def self.down
    remove_column :conditions, :display_name
  end
end
