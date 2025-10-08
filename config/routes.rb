Rails.application.routes.draw do

  get "application/L4"
  root "application#L4"
  get "up" => "rails/health#show", as: :rails_health_check
  
  end