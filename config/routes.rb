Rails.application.routes.draw do
   mount_devise_token_auth_for 'User', at: 'auth'
    resources :locations do
      resources :reviews
    end
  
   resources :reviews
 end
