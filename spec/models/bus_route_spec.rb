require 'rails_helper'

RSpec.describe BusRoute, type: :model do
  let(:bus_route) { BusRoute.create() }
  
  describe "Bus Route" do
    it "has_many stops" do 
      expect(bus_route.stop_id).to eq 9
    end
  end
end
