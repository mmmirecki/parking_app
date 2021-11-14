Rails.application.routes.draw do
  root "parking_spots#index"
  #Slack routes
  post "/book_slack", to: "slack_reservations#create"
  # Resesrvation routes
  #get "/history", to: "reservations#index"
  resources :parking_spots do
    resources :reservations
  end
  #Authentication routes
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]
end
