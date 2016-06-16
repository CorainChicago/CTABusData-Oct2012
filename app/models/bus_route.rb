class BusRoute < ActiveRecord::Base
  belongs_to :stop
  validates :bus_number, :stop_id, :boarding_number, :stop_order, presence: true

  def self.bus_hash_by_stop_count
    all.each_with_object({}) do |r, accum|
      accum[r.bus_number] ||= 0
      accum[r.bus_number] +=1
    end
  end

  def self.order_by_stops(hash)
    hash.sort {|a,b| b[1]<=>a[1]}
  end

  def self.boarding_average(stop_id)
    BusRoute.find_by(stop_id: stop_id).boarding_number rescue nil
  end
end
