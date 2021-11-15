class ReservationsController < ApplicationController
  def index
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
  end
  
  def create
    if logged_in?
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
    else
      redirect_to root_path, alert: "Please login to perform this action"
    end
  end

  def destroy
    if logged_in?
      @parking_spot = ParkingSpot.find(params[:parking_spot_id])
      @logged_user = User.find(session[:user_id])
      if @parking_spot.reservations.last[:user_name] == @logged_user[:username]
        @parking_spot.reservations.last.update(reserved: false)
        redirect_to root_path, alert: 'Your reservation has been canceled'
      else
        redirect_to root_path, alert: 'This is not yours'
      end
    else
      redirect_to root_path, alert: "Please login to perform this action"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_name,:time_booked,:reserved)
  end
end
