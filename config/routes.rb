Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/workspace', as: 'rails_admin'
  devise_for :users
  root 'pages#show', page: 'home'

  get '/enter_workspace', to: 'pages#enter_workspace', as: 'enter_workspace'
  get '/:page', to: 'pages#show', as: 'pages'
end
