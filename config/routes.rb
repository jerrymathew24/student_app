Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :students, only: [:new, :create, :index]

  namespace :api do
    resources :students, only: [:index]
  end

  # Set root to HomeController's index action
  root 'home#index'
end
