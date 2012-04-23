class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.string :number
      t.integer :ordering_company_id
      t.integer :status
      t.text :note
      t.integer :supplier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
