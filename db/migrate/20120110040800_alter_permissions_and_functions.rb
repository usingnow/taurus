class AlterPermissionsAndFunctions < ActiveRecord::Migration
  def self.up
    remove_column :functions, :subject_class
    add_column :operatings, :subject_class, :string
    remove_column :permissions, :function_id
  end

  def self.down
    add_column :functions, :subject_class, :string
    remove_column :operatings, :subject_class
    add_column :permissions, :function_id, :integer
  end
end
