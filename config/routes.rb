Rails.application.routes.draw do
  resources :lunches
  devise_for :users
  root to: "home#index"

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
