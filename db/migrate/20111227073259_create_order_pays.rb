class CreateOrderPays < ActiveRecord::Migration
  def self.up
    create_table :order_pays do |t|
      t.integer :order_id
      t.integer :procedure_id
      t.string :buyer_alipay_no
      t.datetime :alipay_date
      t.string :alipay_no
      t.decimal :alipay_price, :precision => 8, :scale => 2
      t.string :province_no
      t.string :remittance_no
      t.decimal :price, :precision => 8, :scale => 2
      t.datetime :pay_date
      t.string :pay_bank
      t.string :remitter
      t.string :note
      t.integer :bank_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :order_pays
  end
end
