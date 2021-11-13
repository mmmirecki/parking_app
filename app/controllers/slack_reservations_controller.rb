class SlackReservationsController < ApplicationController
  def create
    render json: {
      response_type: 'in_channel',
      text: params[:user_name]
    }
  end
end
