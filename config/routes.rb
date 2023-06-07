Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end


  resources :users, only: [:index, :show]
  get 'profile', to: 'users#profile'

  root 'users#index'
end
