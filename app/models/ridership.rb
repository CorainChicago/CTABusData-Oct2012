class Ridership < ActiveRecord::Base

  #t
   def self.bus_hash_by_stop_count
    all.each_with_object({}) do |r, accum|
      return if r.bus_number == nil
      buses = r.bus_number.split(',')
      buses.each do |b| 
        if accum[b] == nil
          accum[b] = 1
        else
          accum[b] += 1
        end
      end
    end
  end
  #t
  def self.order_by_stops(hash)
    hash.sort {|a,b| b[1]<=>a[1]}
  end

  def self.boarding_average(location)
    Ridership.find_by(location: location).boarding_number rescue nil
  end

  #t
  def self.stop_array_by_bus_route_count
    all.each_with_object([]) do |r, accum|
      return if r.bus_number == nil
      r.bus_number.split(',').count
      accum << [{cross_street: r.cross_street, on_street: r.on_street}, r.bus_number.split(',').count]
    end
  end

  def self.stop_hash_by_bus_route_count
    all.each_with_object({}) do |r, accum|
      accum[r.location] = [r, r.bus_number.split(',').count]
    end
  end

  def self.order_by_bus_route_count(array)
    array.sort {|a,b| b[1]<=>a[1]}
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



