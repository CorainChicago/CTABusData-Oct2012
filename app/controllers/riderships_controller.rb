class RidershipsController < ApplicationController

  def index
    bus_hash = Ridership.bus_hash_by_stop_count
    @longest = Ridership.order_by_stops(bus_hash).first

    stop_array = Ridership.stop_array_by_bus_route_count
    @most_active = Ridership.order_by_bus_route_count(stop_array).first.flatten
  end

  def data_stop_location_and_bus_count
    respond_to do |format|
      format.json {
        render :json => Ridership.hash_by_location_and_bus_count.to_json
      }
    end
  end

  #for map and graph
  def boarding_average_graph
    respond_to do |format|
      format.json {
        render :json => Ridership.hash_average_boarding_data_by_stop.to_json
      }
    end
  end

  #for graph of stops by number of buses
  def stops_by_buses
    hash = Ridership.stop_hash_by_bus_route_count
    bus_array = Ridership.order_by_bus_route_count(hash)
    respond_to do |format|
      format.json {
        render :json => [bus_array, bus_array.map{|d| d[1] }.flatten]
      }
    end
  end
end

