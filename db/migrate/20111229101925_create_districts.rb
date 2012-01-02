class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.integer :city_no
      t.string :name
      t.string :number
      t.decimal :free_shipping_limit, :precision, :scale => 2
      t.decimal :shipping_fee, :precision, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end