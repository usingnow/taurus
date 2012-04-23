class AddLineTypeAndLinkToImages < ActiveRecord::Migration
  def change
    add_column :images, :line_type, :integer, :default => 0
    add_column :images, :href, :string
  end
end
