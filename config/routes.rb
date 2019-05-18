Rails.application.routes.draw do

  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]
  
  root to: 'registrations#new'

  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end
  
end
