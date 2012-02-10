class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :internal_title
      t.text :description

      t.timestamps
    end
  end
end
