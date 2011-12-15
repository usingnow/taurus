class CreateSkus < ActiveRecord::Migration
  def self.up
    create_table :skus do |t|
      t.string :number
      t.string :name
      t.integer :brand_id
      t.integer :sku_category_id
      t.string :unit
      t.string :specification
      t.string :delivery_day
      t.integer :type
      t.string :model
      t.string :size
      t.text :delivery_description
      t.boolean :can_return
      t.text :description
      t.string :color
      t.boolean :can_on_be_half
      t.integer :classifcation
      t.boolean :is_integral
      t.integer :integral
      t.text :introduction
      t.text :advertisement
      t.integer :status
      t.integer :sales_status
      t.decimal :cost_bef_tax, :precision => 8, :scale => 2
      t.decimal :cost_aft_tax, :precision => 8, :scale => 2
      t.decimal :market_price, :precision => 8, :scale => 2
      t.decimal :assembling_fee_bef_tax, :precision => 8, :scale => 2
      t.decimal :assembling_fee_aft_tax, :precision => 8, :scale => 2
      t.decimal :installation_cost_bef_tax, :precision => 8, :scale => 2
      t.decimal :insatllation_cost_aft_tax, :precision => 8, :scale => 2
      t.string :create_by
      t.string :update_by
      t.integer :total_sale

      t.timestamps
    end
  end

  def self.down
    drop_table :skus
  end
end
