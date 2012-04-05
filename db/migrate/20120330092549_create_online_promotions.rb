class CreateOnlinePromotions < ActiveRecord::Migration
  def change
    create_table :online_promotions do |t|
      t.string :online_promotionable_type
      t.integer :online_promotionable_id
      t.string :code
      t.string :title
      t.integer :promotion_type
      t.string :description
      t.datetime :start
      t.datetime :end
      t.integer :status
      t.integer :member_type, :default => 0
      t.integer :min_member_point, :default => 0
      t.datetime :member_sign_up_start
      t.datetime :member_sign_up_end
      t.integer :order_channel
      t.boolean :free_installation, :default => false
      t.boolean :free_assembling, :default => false
      t.integer :points_promotion_method
      t.decimal :points_promotion_parameter, :precision => 8, :scale => 2, :default => 0.00
      t.integer :product_id
      t.boolean :priority, :default => false

      t.timestamps
    end
    add_index :online_promotions, :code, :unique => true
    add_index :online_promotions, :online_promotionable_id
    add_index :online_promotions, :product_id
  end
end
