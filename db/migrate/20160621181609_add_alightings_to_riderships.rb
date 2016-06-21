class AddAlightingsToRiderships < ActiveRecord::Migration
  def change
    add_column :riderships, :alightings, :float
  end
end
