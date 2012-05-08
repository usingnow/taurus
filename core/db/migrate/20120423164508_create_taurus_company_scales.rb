class CreateTaurusCompanyScales < ActiveRecord::Migration
  def change
    create_table :taurus_company_scales do |t|
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end
end
