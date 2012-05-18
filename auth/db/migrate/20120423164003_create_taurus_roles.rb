class CreateTaurusRoles < ActiveRecord::Migration
  def change
    create_table :taurus_roles do |t|
      t.string :name
      t.string :description
      t.boolean :is_reserved
      t.integer :role_type, :default => 0

      t.timestamps
    end


  end
end
