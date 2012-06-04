class CreateTaurusPromotionRuleUsers < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_rule_users, :force => true do |t|
	    t.integer :promotion_rule_id
	    t.integer :user_id

	    t.timestamps
	  end
	  add_index :taurus_promotion_rule_users, :promotion_rule_id
	  add_index :taurus_promotion_rule_users, :user_id
  end
end