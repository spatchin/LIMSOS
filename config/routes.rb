Rails.application.routes.draw do
  get '/:page', to: 'pages#show', as: 'pages'
  root 'pages#show', page: 'home'

  devise_for :users
  resources :users

  resources :feedstocks
  resources :biomass_types
  resources :biomasses
  resources :harvests
end
