Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'messages#index'

  resources :messages, only: [:index, :create]
end
