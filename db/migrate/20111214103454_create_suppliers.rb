class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :input_person
      t.string :contact_name
      t.string :contact_way
      t.string :terms_of_exchange
      t.string :delivery
      t.string :level
      t.boolean :active
      t.string :create_by
      t.string :update_by

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
