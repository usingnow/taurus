class CreateTaurusAdministratorGroupLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_administrator_group_line_items do |t|
      t.integer :administrator_id
      t.integer :group_id

      t.timestamps
    end
    add_index :taurus_administrator_group_line_items, :administrator_id
    add_index :taurus_administrator_group_line_items, :group_id
  end
end
