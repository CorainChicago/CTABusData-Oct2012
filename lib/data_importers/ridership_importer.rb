require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
require 'csv'

module DataImporters
  module RidershipImporter
    class << self
      def import
        row_count = 0 
        csv = CSV.read(Rails.root.join("lib", "data_for_importing", "CTA_-_Ridership_-_Avg._Weekday_Bus_Stop_Boardings_in_October_2012.csv")).each do |row| 
          if row != nil && row_count != 0 && row[3] != nil
            Ridership.create(on_street: row[1], cross_street: row[2], bus_number: row[3], boarding_number: row[4], location: row[8])
          end
          row_count += 1
        end
        puts csv
      end  
    end  
  end
end