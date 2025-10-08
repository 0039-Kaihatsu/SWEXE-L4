Rails.application.routes.draw do
<<<<<<< HEAD

  get "application/L4"
  root "application#L4"
  get "up" => "rails/health#show", as: :rails_health_check
  
  end
=======
  
  get "top/main"
  post "top/login"
  get "top/logout"
  root "top#main"
  get "up" => "rails/health#show", as: :rails_health_check
end
>>>>>>> 3dc6dc1 (基礎課題終了)
