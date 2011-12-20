class ChangeActiveToBrand < ActiveRecord::Migration
  def self.up
    change_column :brands, :active, :integer
  end

  def self.down
    change_column :brands, :active, :boolean
  end
end
