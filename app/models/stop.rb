class Stop < ActiveRecord::Base
  has_many :bus_routes
  validates :on_street, :cross_street, :location, presence: true
  validates :location, uniqueness: true

  def self.stop_array_by_bus_route_count
    all.each_with_object([]) do |s, accum|
      accum << [s, s.bus_routes.count]
    end
  end

  def self.stop_hash_by_bus_route_count
    all.each_with_object({}) do |s, accum|
      accum[s.id] = [s, s.bus_routes.count]
    end
  end

  def self.order_by_bus_route_count(hash)
    hash.sort {|a,b| b[1]<=>a[1]}
  end

  def self.hash_by_location_and_bus_count
    all.each_with_object({}) do |s, accum|
      location_array = s.location.tr('()', '').split(',')
      accum[s.on_street + " " + s.cross_street] = {center: {lat: location_array[0].to_f, lng: location_array[1].to_f}, buses: s.bus_routes.count}
    end
  end

  def self.hash_average_boarding_data_by_stop
    all.each_with_object({}) do |s, accum|
      location_array = s.location.tr('()', '').split(',')
      accum[s.on_street + " " + s.cross_street] = {center: {lat: location_array[0].to_f, lng: location_array[1].to_f}, boarding_number: s.bus_routes.inject(0) {|sum, b| sum + b.boarding_number}}
    end
  end
end

