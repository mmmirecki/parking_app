class ReservationsController < ApplicationController
  def create
    redirect_to root_path, alert: "Your reservation has been made #{params[:reservation][:user_name]}"
  end
    
end
