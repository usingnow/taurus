class DeviseCreateTaurusUsers < ActiveRecord::Migration
  def change
    create_table(:taurus_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.integer :taurus_userable_id
      t.string  :taurus_userable_type
      t.integer :points
      t.integer :store_id
      t.integer :role_id
      t.boolean :status

      t.timestamps
    end

    add_index :taurus_users, :email,                :unique => true
    add_index :taurus_users, :reset_password_token, :unique => true
    add_index :taurus_users, :confirmation_token,   :unique => true
    # add_index :taurus_users, :unlock_token,         :unique => true
    # add_index :taurus_users, :authentication_token, :unique => true
    
    add_index :taurus_users, :store_id
    add_index :taurus_users, :role_id
  end
end
