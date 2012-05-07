class CreateTaurusProvinces < ActiveRecord::Migration
  def change
    create_table :taurus_provinces do |t|
      t.string :number
      t.string :name
      t.decimal :free_shipping_limit, :precision => 8, :scale => 2
      t.decimal :shipping_fee, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
