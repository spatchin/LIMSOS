Rails.application.routes.draw do
  get '/:page', to: 'pages#show', as: 'pages'
  root 'pages#show', page: 'home'

  devise_for :users
  resources :users
end
