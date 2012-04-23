class AddTimeTopermissionsAndOperatings < ActiveRecord::Migration
  def up
    add_column :components, :updated_at, :datetime
    add_column :components, :created_at, :datetime
    add_column :functions, :updated_at, :datetime
    add_column :functions, :created_at, :datetime
    add_column :operatings, :updated_at, :datetime
    add_column :operatings, :created_at, :datetime
    add_column :permissions, :updated_at, :datetime
    add_column :permissions, :created_at, :datetime
    add_column :systems, :updated_at, :datetime
    add_column :systems, :created_at, :datetime
    add_column :panic_buyings, :updated_at, :datetime
    add_column :panic_buyings, :created_at, :datetime
  end

  def down
    remove_column :components, :updated_at
    remove_column :components, :created_at
    remove_column :functions, :updated_at
    remove_column :functions, :created_at
    remove_column :operatings, :updated_at
    remove_column :operatings, :created_at
    remove_column :permissions, :updated_at
    remove_column :permissions, :created_at
    remove_column :systems, :updated_at
    remove_column :systems, :created_at
    remove_column :panic_buyings, :updated_at
    remove_column :panic_buyings, :created_at
  end
end
