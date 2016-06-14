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
            BusRoute.create(bus_number: row[3], stop_id: stop.id, boarding_number: row[4], stop_order: row[0])
          end
          row_count += 1
        end
        puts csv
      end
    end
  end
end