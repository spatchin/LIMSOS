Rails.application.routes.draw do
  devise_for :users
  resources :feedstocks
  resources :biomass_types
  resources :biomasses
  resources :harvests

  root 'pages#show', page: 'home'
  get '/:page', to: 'pages#show', as: 'pages'
end
