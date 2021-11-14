class ReservationsController < ApplicationController
  def index
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
  end
  
  def create
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
    if @parking_spot.reservations.exists?
      if @parking_spot.reservations.last.reservation_is_valid?
        redirect_to root_path, alert: "This spot is taken"
      else
        @reservation = @parking_spot.reservations.create(reservation_params)
        redirect_to root_path, alert: "Your reservation has been made #{params[:reservation][:user_name]}"
      end
    else
      @reservation = @parking_spot.reservations.create(reservation_params)
      redirect_to root_path, alert: "Your reservation has been made #{params[:reservation][:user_name]}"
    end
  end

  def destroy
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
    @parking_spot.reservations.last.update(reserved: false)
    redirect_to root_path, alert: 'Your reservation has been canceled'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_name,:time_booked,:reserved)
  end
end
