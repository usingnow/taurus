class CreateProcedureRoleships < ActiveRecord::Migration
  def self.up
    create_table :procedure_roleships do |t|
      t.integer :procedure_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :procedure_roleships
  end
end
