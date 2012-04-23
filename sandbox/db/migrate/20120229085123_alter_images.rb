class AlterImages < ActiveRecord::Migration
  def up
    add_column :images, :description, :text
  end

  def down
    remove_column :images, :description
  end
end
