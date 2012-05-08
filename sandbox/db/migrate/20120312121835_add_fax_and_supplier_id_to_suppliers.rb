class AddFaxAndSupplierIdToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :fax, :string
    add_column :suppliers, :supplier_id, :string
  end
end
