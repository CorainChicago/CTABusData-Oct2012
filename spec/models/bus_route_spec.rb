require 'rails_helper'

RSpec.describe BusRoute, type: :model do
  describe "bus_hash_by_stop_count" do

    after(:all) do
      @bus_route = BusRoute.all
      @bus_route.each {|b| b.destroy}
    end
  
    let!(:bus_route) { BusRoute.create!(bus_number: 126, stop_id: 1, boarding_number: 183, stop_order: 1) }

    it "returns a hash" do 
      result = BusRoute.bus_hash_by_stop_count
      expect(result).to be_a_kind_of(Hash)
    end

    it "uses the bus number as the keys" do
      result = BusRoute.bus_hash_by_stop_count
      expect(result.keys.first).to eq 126 
    end

    it "has a list of the bus stop ids as the values" do 
      BusRoute.create!(bus_number: 126, stop_id: 2, boarding_number: 183, stop_order: 1)
      result = BusRoute.bus_hash_by_stop_count
      expect(result.values.first.count).to eq 2 
    end
  end

  describe "order_by_stops(hash)" do
    hash = BusRoute.bus_hash_by_stop_count
    result = BusRoute.order_by_stops(hash)
    it "returns an array" do
      expect(result).to be_a_kind_of(Array)
    end
  end
end
