class StopsController < ApplicationController

  def data_stop_location_and_bus_count
    respond_to do |format|
      format.json {
        render :json => Stop.hash_by_location_and_bus_count.to_json
      }
    end
  end

  #for map and graph
  def boarding_average_graph
    respond_to do |format|
      format.json {
        render :json => Stop.hash_average_boarding_data_by_stop.to_json
      }
    end
  end

  #for graph of stops by number of buses
  def stops_by_buses
    hash = Stop.stop_hash_by_bus_route_count
    bus_array = Stop.order_by_bus_route_count(hash)
    respond_to do |format|
      format.json {
        render :json => [bus_array, bus_array.map{|d| d[1] }.flatten]
      }
    end
  end
end






