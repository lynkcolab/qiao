Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  get '/lunches/match', to: 'lunches#match' 
  get '/lunches/cancel_next_lunch', to: 'lunches#cancel_next_lunch' 
  resources :lunches

  get  'static_pages/conversations'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
