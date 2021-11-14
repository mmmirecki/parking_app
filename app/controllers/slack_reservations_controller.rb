class SlackReservationsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @response_message = "Something went wrong"
    @parking_spot = ParkingSpot.first
    if params[:text]
      if @parking_spot.reservations.exists?
        if @parking_spot.reservations.last.reservation_is_valid?
          @response_message = "This spot is taken"
        else
          @reservation = @parking_spot.reservations.create(user_name:params[:user_name],time_booked:Time.now,reserved:true)
          @response_message = "Your reservation has been made"
        end
      else
        @response_message = "Your reservation has been made"
        @reservation = @parking_spot.reservations.create(user_name:params[:user_name],time_booked:Time.now,reserved:true)
      end
    else
      @response_message = "succesfuly cancelled"
    end

    render json: {
      response_type: 'in_channel',
      text: @response_message
    }
  end
end
