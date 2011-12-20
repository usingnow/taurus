class RemoveCreateTimeAndUpdateTimeToProduct < ActiveRecord::Migration
  def self.up
    remove_column :products, :create_time, :update_time
  end

  def self.down
    add_column :products, :create_time, :datetime
    add_column :products, :update_time, :datetime
  end
end
