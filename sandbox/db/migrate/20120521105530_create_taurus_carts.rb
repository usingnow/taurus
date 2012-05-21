class CreateTaurusCarts < ActiveRecord::Migration
  def change
    create_table :taurus_carts do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :taurus_carts, :user_id
  end

end
