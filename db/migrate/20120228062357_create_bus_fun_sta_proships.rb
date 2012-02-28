class CreateBusFunStaProships < ActiveRecord::Migration
  def change
    create_table :bus_fun_sta_proships do |t|
      t.integer :station_procedureship_id
      t.integer :business_function_id

      t.timestamps
    end
  end
end
