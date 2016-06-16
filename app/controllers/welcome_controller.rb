class WelcomeController < ApplicationController

  def index
    bus_hash = BusRoute.bus_hash_by_stop_count
    p stop_hash = Stop.stop_hash_by_bus_route_count
    @longest = BusRoute.order_by_stops(bus_hash).first
    p @most_active = Stop.order_by_bus_route_count(stop_hash)
  end
end