class CreateStoreEntries < ActiveRecord::Migration
  def self.up
    create_table :store_entries do |t|
      t.string :number
      t.integer :purchase_id
      t.integer :ordering_company_id
      t.integer :supplier_id
      t.integer :store_id
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :store_entries
  end
end
