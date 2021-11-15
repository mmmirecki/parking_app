require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test 'should create reservation' do
    one = reservations(:one)
    reservation = Reservation.new(user_name: one.user_name, time_booked: one.time_booked, reserved: one.reserved, parking_spot: one.parking_spot)
    assert reservation.save
  end

  
end
