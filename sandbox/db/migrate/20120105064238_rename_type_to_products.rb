class RenameTypeToProducts < ActiveRecord::Migration
  def self.up
    rename_column :products, :type, :line_type
  end

  def self.down
    rename_column :products, :line_type , :type
  end
end
