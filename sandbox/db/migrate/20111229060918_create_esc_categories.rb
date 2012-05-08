class CreateEscCategories < ActiveRecord::Migration
  def self.up
    create_table :esc_categories do |t|
      t.string :name
      t.integer :sequence
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :esc_categories
  end
end
