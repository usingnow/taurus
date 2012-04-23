class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :number
      t.string :name
      t.string :description
      t.boolean :is_reserve

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
