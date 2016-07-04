Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :games, only: [:new, :create, :show, :update]
  resources :boards, only: [:show, :update]

  # post '/pick_markers' => 'boards#pick_markers'
end
