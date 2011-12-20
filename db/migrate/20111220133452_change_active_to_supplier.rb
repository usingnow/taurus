class ChangeActiveToSupplier < ActiveRecord::Migration
  def self.up
    change_column :suppliers, :active, :integer
  end

  def self.down
    change_column :suppliers, :active, :boolean
  end
end
