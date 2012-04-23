class AddActiveToOrderingCompany < ActiveRecord::Migration
  def self.up
    add_column :ordering_companies, :active, :boolean
  end

  def self.down
    remove_column :ordering_companies, :active
  end
end
