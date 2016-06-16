class WelcomeController < ApplicationController

  def index
    bus_hash = BusRoute.bus_hash_by_stop_count
    stop_array = Stop.stop_array_by_bus_route_count
    @longest = BusRoute.order_by_stops(bus_hash).first
    @most_active = Stop.order_by_bus_route_count(stop_array)
  end
end