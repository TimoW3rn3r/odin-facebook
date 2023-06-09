Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:new, :create]
  end


  resources :users, only: [:index, :show, :update]
  get 'profile', to: 'users#profile'
  get 'profile/edit', to: 'users#edit'

  root 'users#index'
end
