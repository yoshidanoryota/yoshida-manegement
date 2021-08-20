Rails.application.routes.draw do
  devise_for :users
  
  root to: "attendances#index"
  resources :attendances, only: [:index,:new,:create]
  resources :outs, only: [:new,:create]
  resources :rests, only: [:new,:create]
  resources :comments, only: [:new,:create,:edit,:update]

end
