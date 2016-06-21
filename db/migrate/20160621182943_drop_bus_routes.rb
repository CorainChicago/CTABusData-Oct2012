class DropBusRoutes < ActiveRecord::Migration
  def change
    drop_table :bus_routes
  end
end
