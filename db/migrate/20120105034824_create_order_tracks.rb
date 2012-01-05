class CreateOrderTracks < ActiveRecord::Migration
  def self.up
    create_table :order_tracks do |t|
      t.integer :order_id
      t.boolean :is_display
      t.string :description
      t.string :created_by
      t.integer :admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :order_tracks
  end
end
