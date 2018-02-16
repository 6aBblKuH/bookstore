Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories, only: %i[index show]
  resources :books
end
