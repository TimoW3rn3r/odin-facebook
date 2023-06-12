Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:new, :create] do
      resources :likes, only: [:index, :create, :destroy]
    end
    resources :likes, only: [:index, :create, :destroy]
  end

  resources :friendships, only: [:create, :destroy]
  patch 'friendships/:id', to: 'friendships#accept'

  resources :users, only: [:index, :show, :update]
  get 'users/:id/friends', to: 'users#friends', as: 'user_friends'
  get 'profile', to: 'users#profile'
  get 'profile/edit', to: 'users#edit'

  root 'users#index'
end
