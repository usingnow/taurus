class DeviseCreateTaurusAdministrators < ActiveRecord::Migration
  def self.up
    create_table(:taurus_administrators) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      
      t.boolean :status
      t.string :name
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :zip_code
      t.string :address

      t.timestamps
    end

    add_index :taurus_administrators, :email,                :unique => true
    add_index :taurus_administrators, :reset_password_token, :unique => true
    # add_index :taurus_administrators, :confirmation_token,   :unique => true
    # add_index :taurus_administrators, :unlock_token,         :unique => true
    # add_index :taurus_administrators, :authentication_token, :unique => true
  end

  def self.down
    drop_table :taurus_administrators
  end
end
