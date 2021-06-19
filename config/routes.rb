Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: %i[new create]
  resource :squirrel, only: %i[show update]
  resource :activity, only: %i[show update]
  resource :setting, only: %i[update]
  resources :videos, only: %i[index show]
end
  