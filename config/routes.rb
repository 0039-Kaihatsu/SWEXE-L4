Rails.application.routes.draw do
  get "top/main"
  post "top/login"
  get "top/logout"
  root "top#main"
  get "up" => "rails/health#show", as: :rails_health_check
end
