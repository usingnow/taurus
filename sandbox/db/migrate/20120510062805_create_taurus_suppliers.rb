class CreateTaurusSuppliers < ActiveRecord::Migration
  def change
    create_table :taurus_suppliers do |t|
      t.string :number
      t.string :name
      t.string :contact_name
      t.string :contact_phone
      t.boolean :status
      t.string :remarks
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
