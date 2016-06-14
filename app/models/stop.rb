class Stop < ActiveRecord::Base
  validates :location, uniqueness: true
end
