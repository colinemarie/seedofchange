Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'landing', to: 'pages#landing'
  get 'no_clan', to: 'pages#no_clan'
  resources :challenges, only: [ :show ]
  resources :users, only: [ :show ]
  resources :clans, only: [ :show ] do
    post :add_user, on: :member
    resources :activities, only: [ :index ]
  end
  resources :user_challenges, only: [ :index, :create, :show] do
    member { patch :accept, :decline, :validate, :drop }
  end
  resources :invitations, only: [:create, :update]
  resources :activities do
    post :read, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

