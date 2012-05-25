class CreateTaurusAlipaies < ActiveRecord::Migration
  def change
    create_table :taurus_alipays do |t|
      t.string :partner
      t.string :seller_email
      t.string :subject
      t.string :body

      t.timestamps
    end
  end

end
