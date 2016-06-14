class BusRoute < ActiveRecord::Base
  belongs_to :stop

  def self.bus_hash_by_stop_count
    all.each_with_object({}) do |r, accum|
      accum[r.bus_number] ||= 0
      accum[r.bus_number] +=1
    end
  end

  def self.order_by_stops(hash)
    hash.sort {|a,b| b[1]<=>a[1]}
  end
end
