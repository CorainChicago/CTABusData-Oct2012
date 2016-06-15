class StopsController < ApplicationController

  def index
    @stops = Stop.all
  end

  def data
    hash = BusRoute.bus_hash_by_stop_count
    stop_array = BusRoute.order_by_stops(hash)
    respond_to do |format|
      format.json {
        render :json => [stop_array, stop_array.map{|d| d[1] }.flatten]
      }
    end
  end
end
