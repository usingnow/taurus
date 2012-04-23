class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.string :number
      t.string :name
      t.decimal :free_shipping_limit, :precision => 8, :scale => 2
      t.decimal :shipping_fee, :precision, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :provinces
  end
end
