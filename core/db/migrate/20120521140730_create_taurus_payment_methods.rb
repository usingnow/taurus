class CreateTaurusPaymentMethods < ActiveRecord::Migration
  def change
    create_table :taurus_payment_methods do |t|
      t.string :name
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end

end
