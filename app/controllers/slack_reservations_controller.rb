class SlackReservationsController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    @response_message = "Something went wrong"
    @parking_spot = ParkingSpot.first
    if @parking_spot.reservations.exists?
      if @parking_spot.reservations.last.reservation_is_valid?
        @response_message = "This spot is taken"
        redirect_to root_path, alert: @response_message
      else
        @reservation = @parking_spot.reservations.create(reservation_params)
        @response_message = "Your reservation has been made"
        redirect_to root_path, alert: "Your reservation has been made #{params[:reservation][:user_name]}"
      end
    else
      @response_message = "Your reservation has been made"
      @reservation = @parking_spot.reservations.create(reservation_params)
      redirect_to root_path, alert: "Your reservation has been made #{params[:reservation][:user_name]}"
    end

    render json: {
      response_type: 'in_channel',
      text: @response_message
    }
  end
end
