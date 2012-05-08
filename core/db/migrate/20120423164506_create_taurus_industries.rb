class CreateTaurusIndustries < ActiveRecord::Migration
  def change
    create_table :taurus_industries do |t|
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end
end
