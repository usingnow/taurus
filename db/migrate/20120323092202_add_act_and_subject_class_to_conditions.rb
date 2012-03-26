class AddActAndSubjectClassToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :act, :string
    add_column :conditions, :subject_class, :string
  end
end
