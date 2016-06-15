require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
require 'csv'

module DataImporters
  module CTAImporter
    class << self
      
      def import
        row_count = 0 
        csv = CSV.read(Rails.root.join("lib", "data_for_importing", "CTA_-_Ridership_-_Avg._Weekday_Bus_Stop_Boardings_in_October_2012.csv")).each do |row| 
          if row != nil && row_count != 0
            stop = Stop.find_or_create_by(on_street: row[1] , cross_street: row[2] , location: row[8])
            set_bus_routes(row, stop)
          end
          row_count += 1
        end
        puts csv
      end

      def set_bus_routes(row, stop)
        bus_number = row[3].split(',')
        if bus_number.length == 1 
          BusRoute.create!(bus_number: bus_number[0], stop_id: stop.id, boarding_number: row[4], stop_order: row[0])
        else
          for x in 0..bus_number.length-1 do
            BusRoute.create!(bus_number: bus_number[x], stop_id: stop.id, boarding_number: row[4], stop_order: row[0])
          end
        end
      end
    end
  end
end