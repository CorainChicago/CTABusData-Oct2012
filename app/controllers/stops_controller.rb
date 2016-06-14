class StopsController < ApplicationController

  def index
    @stops = Stop.all
  end

  def data
    hash = BusRoute.bus_hash_by_stop_count
    respond_to do |format|
      format.json {
        render :json => BusRoute.order_by_stops(hash).map{|d| d[1] }.flatten
      }
    end
  end
end
