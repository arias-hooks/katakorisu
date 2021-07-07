Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create]
  resource :squirrel, only: %i[show update]
  resource :activity, only: %i[show update]
  resource :setting, only: %i[update]
  resources :videos, only: %i[index show]

  get 'terms' => 'static_pages#terms'
  get 'privacy' => 'static_pages#privacy'
  get 'top' => 'static_pages#top'
  get 'description' => 'static_pages#description'
end
