class CreateBusRoutes < ActiveRecord::Migration
  def change
    create_table :bus_routes do |t|
      t.integer :bus_number
      t.integer :stop_id
      t.integer :boarding_number
      t.integer :stop_order

      t.timestamps null: false
    end
  end
end
