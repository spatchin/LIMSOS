Rails.application.routes.draw do
  root 'pages#show', page: 'home'

  devise_for :users
  mount RailsAdmin::Engine => '/workspace', as: 'rails_admin'

  get '/enter_workspace', to: 'pages#enter_workspace', as: 'enter_workspace'
  get '/:page', to: 'pages#show', as: 'pages'
end
