class CreateOrderingCompanies < ActiveRecord::Migration
  def self.up
    create_table :ordering_companies do |t|
      t.string :number
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :ordering_companies
  end
end
