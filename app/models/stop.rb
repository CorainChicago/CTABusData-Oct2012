class Stop < ActiveRecord::Base
  has_many :bus_routes
  validates :location, uniqueness: true

  def self. 
end
