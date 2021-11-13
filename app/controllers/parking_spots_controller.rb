class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
  end

  def show
    @parking_spot = ParkingSpot.find(params[:id])
  end
end
