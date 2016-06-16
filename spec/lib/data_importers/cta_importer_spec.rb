require "rails_helper"
require "tempfile"

RSpec.describe DataImporters::CTAImporter do

  before(:all) do
    @bus_route = BusRoute.all
    @bus_route.each {|b| b.destroy}
  end

  after(:all) do
    @bus_route = BusRoute.all
    @bus_route.each {|b| b.destroy}
  end


  describe "set_bus_routes" do 

    it "creates one bus route" do 
      row = ["1", "JACKSON", "AUSTIN", "126", "183.4", "150", "10/01/2012", "Weekday", "(41.87632184, -87.77410480)"]
      stop = Stop.create(on_street: row[1] , cross_street: row[2] , location: row[8])
      DataImporters::CTAImporter.set_bus_routes(row, stop)
      expect(BusRoute.all.count).to eq 1 
    end

    it "creates two bus routes when given a row with two bus_numbers" do 
      row = ["1", "JACKSON", "AUSTIN", '"1,7,X28,126,129"', "183.4", "150", "10/01/2012", "Weekday", "(41.87632184, -87.77410483)"]
      stop = Stop.create(on_street: "Adams" , cross_street: row[2] , location: row[8])
      DataImporters::CTAImporter.set_bus_routes(row, stop)
      puts BusRoute.all
      expect(BusRoute.all.count).to eq 5 
    end
  end

end