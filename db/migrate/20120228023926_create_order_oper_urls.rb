class CreateOrderOperUrls < ActiveRecord::Migration
  def change
    create_table :order_oper_urls do |t|
      t.string :name
      t.string :url
      t.string :link_method
      t.string :confirm

      t.timestamps
    end
  end
end
