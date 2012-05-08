class CreateTaurusGroups < ActiveRecord::Migration
  def change
    create_table :taurus_groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
