class CreateCompanyScales < ActiveRecord::Migration
  def self.up
    create_table :company_scales do |t|
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :company_scales
  end
end
