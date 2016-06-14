class BusRoute < ActiveRecord::Base
  belongs_to :stop

  def self.route_length_by_stops
    all.each_with_object
  end
end
