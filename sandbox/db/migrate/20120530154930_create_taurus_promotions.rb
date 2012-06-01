class CreateTaurusPromotions < ActiveRecord::Migration
  def change
    create_table :taurus_promotions, :force => true do |t|
	    t.string :name
	    t.string :event_name
	    t.string :description
	    t.integer :usage_limit, :default => 1
	    t.date :starts_at
	    t.date :expires_at

	    t.timestamps
	  end
  end
end