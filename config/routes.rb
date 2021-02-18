Rails.application.routes.draw do
  # get 'invitations/create'
  devise_for :users
  root to: 'pages#home'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
