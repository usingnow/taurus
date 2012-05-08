class CreateAdministratorGroupships < ActiveRecord::Migration
  def self.up
    create_table :administrator_groupships do |t|
      t.integer :administrator_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :administrator_groupships
  end
end
