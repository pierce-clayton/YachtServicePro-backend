Rails.application.routes.draw do
  resources :checkout_sessions
  resources :products do
    resources :prices
  end
  resources :marinas
  resources :customer_yachts
  resources :yachts
  resources :customers
  resources :sessions, only: %i[create]
  resources :registrations, only: %i[create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
