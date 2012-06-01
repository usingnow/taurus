class CreateTaurusPromotionRules < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_rules, :force => true do |t|
	    t.integer :promotion_id
	    t.decimal :item_total, :precision => 8, :scale => 2, :default => 100
	    t.string :rule_type

	    t.timestamps
	  end
	  add_index :taurus_promotion_rules, :promotion_id
  end
end