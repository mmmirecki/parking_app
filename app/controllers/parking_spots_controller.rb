class ParkingSpotsController < ApplicationController
  #helper_method :current_user, :logged_in?
  def index
    @parking_spots = ParkingSpot.all
  end

  def show
    @parking_spot = ParkingSpot.find(params[:id])
  end
end
