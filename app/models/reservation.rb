class Reservation < ApplicationRecord
  include ValidReservation
  belongs_to :parking_spot
end
