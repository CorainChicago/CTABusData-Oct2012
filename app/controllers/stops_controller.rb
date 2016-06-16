class StopsController < ApplicationController

  def data_bus_stops
    hash = BusRoute.bus_hash_by_stop_count
    stop_array = BusRoute.order_by_stops(hash)
    respond_to do |format|
      format.json {
        render :json => [stop_array, stop_array.map{|d| d[1] }.flatten]
      }
    end
  end

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


