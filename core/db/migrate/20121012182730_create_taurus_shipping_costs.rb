class CreateTaurusShippingCosts < ActiveRecord::Migration
  def change
    create_table :taurus_shipping_costs do |t|
      t.decimal :cost, :precision => 8, :scale => 2, :default => 0
      t.text :remarks

      t.timestamps
    end
  end

end
