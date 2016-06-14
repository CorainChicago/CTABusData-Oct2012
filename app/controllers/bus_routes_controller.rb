class BusRoutesController < ApplicationController

  def index 
    BusRoute.includes(:stop)
  end
end
