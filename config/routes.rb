Rails.application.routes.draw do
  root "appointments#index"

  devise_for :users

  resources :doctors do
  resources :appointments
  end
end
