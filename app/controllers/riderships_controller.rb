class RidershipsController < ApplicationController

  def index
    bus_hash = Ridership.bus_hash_by_stop_count
    @longest = Ridership.order_by_stops(bus_hash).first

    stop_array = Ridership.stop_array_by_bus_route_count
    @most_active = Ridership.order_by_bus_route_count(stop_array).first.flatten
  end

  # MAP data_stop_location_and_bus_count
  def data_stop_location_and_bus_count
    respond_to do |format|
      format.json {
        render :json => Ridership.hash_by_location_and_bus_count.to_json
      }
    end
  end

  #MAP of average boarding number by stop
  def boarding_average_graph
    respond_to do |format|
      format.json {
        render :json => Ridership.hash_average_boarding_data_by_stop.to_json
      }
    end
  end

  #for graph of stops by amount of buses
  def graph_stops_by_number_of_buses
    hash = Ridership.hash_stop_with_bus_count
    stop_array = Ridership.order_by_stops(hash)
    respond_to do |format|
      format.json {
        render :json => [stop_array, stop_array.map{|d| d[1] }]
      }
    end
  end

  #For Graph of buses by number of stops
  def graph_buses_by_number_stops
    hash = Ridership.bus_hash_by_stop_count
    bus_array = Ridership.order_by_stops(hash)
    respond_to do |format|
      format.json {
        p bus_array
        render :json => [bus_array, bus_array.map{|d| d[1] }]
      }
    end
  end
end


