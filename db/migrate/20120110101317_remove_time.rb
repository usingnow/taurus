class RemoveTime < ActiveRecord::Migration
  def self.up
    remove_column :systems, :created_at
    remove_column :systems, :updated_at
    remove_column :components, :created_at
    remove_column :components, :updated_at
    remove_column :functions, :created_at
    remove_column :functions, :updated_at
    remove_column :operatings, :created_at
    remove_column :operatings, :updated_at
    remove_column :permissions, :created_at
    remove_column :permissions, :updated_at
  end

  def self.down
    add_column :systems, :created_at, :datetime
    add_column :systems, :updated_at, :datetime
    add_column :components, :created_at, :datetime
    add_column :components, :updated_at, :datetime
    add_column :functions, :created_at, :datetime
    add_column :functions, :updated_at, :datetime
    add_column :operatings, :created_at, :datetime
    add_column :operatings, :updated_at, :datetime
    add_column :permissions, :created_at, :datetime
    add_column :permissions, :updated_at, :datetime
  end
end
