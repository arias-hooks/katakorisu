Rails.application.routes.draw do
  root 'lp#top'
  resources :users, only: %i[new create]
  resource :squirrel, only: %i[show update]
  resource :activity, only: %i[show update]
  resource :setting, only: %i[update]
  resources :videos, only: %i[index show]

  get 'terms' => 'lp#terms'
  get 'privacy' => 'lp#privacy'
  get 'top' => 'lp#top'
  get 'description' => 'lp#description'
end
