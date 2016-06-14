class BusRoutesController < ApplicationController

  def index 
    @bus_route = BusRoute.all
  end
end
