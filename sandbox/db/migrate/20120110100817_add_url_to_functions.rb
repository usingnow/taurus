class AddUrlToFunctions < ActiveRecord::Migration
  def self.up
    add_column :functions, :url, :string
  end

  def self.down
    remove_column :functions, :url
  end
end
