Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: %i[new create]
  resource :squirrel, only: %i[show]
  resource :activity, only: %i[show]
end
