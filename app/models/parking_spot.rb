class ParkingSpot < ApplicationRecord
  has_many :reservations
end
