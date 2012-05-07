class CreateTaurusCompanyTypes < ActiveRecord::Migration
  def change
    create_table :taurus_company_types do |t|
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end
end
