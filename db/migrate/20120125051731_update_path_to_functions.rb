class UpdatePathToFunctions < ActiveRecord::Migration
  def self.up
    execute("update functions set url = '/store/delivery_orders' where url = '/admin/delivery_orders' ")
  end

  def self.down
    execute("update functions set url = '/admin/delivery_orders' where url = '/store/delivery_orders' ")
  end
end
