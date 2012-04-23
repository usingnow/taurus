class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :group_id
      t.integer :function_id
      t.integer :operating_id

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
