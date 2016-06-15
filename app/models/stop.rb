class Stop < ActiveRecord::Base
  has_many :bus_routes
  validates :location, uniqueness: true

  def self.hash_by_location_and_bus_count
    all.each_with_object({}) do |s, accum|
      accum[s.con_street + " " + s.cross_street] ||= {location: s.location, buses: BusRoute.where(stop.id: s.id).count}
    end
  end
end
