class CreateRiderships < ActiveRecord::Migration
  def change
    create_table :riderships do |t|
      t.string :on_street
      t.string :cross_street
      t.string :bus_number
      t.float :boarding_number
      t.string :location

      t.timestamps null: false
    end
  end
end
