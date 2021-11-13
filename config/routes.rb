Rails.application.routes.draw do
  root "parking_spots#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parking_spots do
    resources :reservations
  end
end
