class SlackReservationsController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    render json: {
      response_type: 'in_channel',
      text: params[:user_name]
    }
  end
end
