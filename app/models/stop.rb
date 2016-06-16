class Stop < ActiveRecord::Base
  has_many :bus_routes
  validates :location, uniqueness: true

  def self.hash_by_location_and_bus_count
    all.each_with_object({}) do |s, accum|
      location_array = s.location.tr('()', '').split(',')
      accum[s.on_street + " " + s.cross_street] = {center: {lat: location_array[0].to_f, lng: location_array[1].to_f}, buses: BusRoute.where(stop_id: s.id).count}
    end
  end

  def self.hash_average_boarding_data_by_stop
    all.each_with_object({}) do |s, accum|
      location_array = s.location.tr('()', '').split(',')
      accum[s.on_street + " " + s.cross_street] = {center: {lat: location_array[0].to_f, lng: location_array[1].to_f}, boarding_averge: BusRoute.boarding_average(s.id)}
    end
  end
end

