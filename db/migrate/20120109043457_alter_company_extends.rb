class AlterCompanyExtends < ActiveRecord::Migration
  def self.up
    rename_column :company_extends, :industry_type_id, :industry_id
  end

  def self.down
    rename_column :company_extends, :industry_id, :industry_type_id
  end
end
