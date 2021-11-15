class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:notice] = "Logged in successfully."
      redirect_to root_path, alert: "Logged in"
    else
      # flash.now[:notice] = "There was something wrong with your login details."
      redirect_to "/login", method: :get
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:notice] = "You have been logged out."
    redirect_to root_path, alert: "Logged out"
  end
end
