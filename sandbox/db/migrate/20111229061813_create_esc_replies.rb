class CreateEscReplies < ActiveRecord::Migration
  def self.up
    create_table :esc_replies do |t|
      t.integer :esc_id
      t.integer :replier
      t.text :content
      t.string :status_changed_info

      t.timestamps
    end
  end

  def self.down
    drop_table :esc_replies
  end
end
