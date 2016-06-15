class StopsController < ApplicationController

  def index
    @stops = Stop.all
  end

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
      byebug
      format.json {
        render :json => Stop.hash_by_location_and_bus_count
      }
    end
  end
end
