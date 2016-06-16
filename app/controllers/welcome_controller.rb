class WelcomeController < ApplicationController

  def index
    hash = BusRoute.bus_hash_by_stop_count
    @longest = BusRoute.order_by_stops(hash).first
    @shortest = BusRoute.order_by_stops(hash).last
  end
end