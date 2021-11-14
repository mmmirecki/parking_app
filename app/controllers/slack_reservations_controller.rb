class SlackReservationsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @response_message = "Something went wrong"
    @parking_spot = ParkingSpot.first
    if params[:text] == "book"
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
    elsif params["text"] == "cancel"
      if @parking_spot.reservations.exists?
        if @parking_spot.reservations.last.user_name == params[:user_name] &&
          @parking_spot.reservations.last.reservation_is_valid?
          @parking_spot.reservations.last.update(reserved: false)
          @response_message = "Succesfully canceled"
        else
          @response_message = "You don't have a reservation"
        end
      else
        @response_message = "You don't have a reservation"
      end
    elsif params["text"] == "who"
      if @parking_spot.reservations.exists?
        if @parking_spot.reservations.last.reservation_is_valid?
          @response_message = "This spot is booked by #{@parking_spot.reservations.last.user_name}"
        else
          @response_message = "There is no reservation"
        end
      end
    end

    render json: {
      response_type: 'in_channel',
      text: @response_message
    }
  end
end
