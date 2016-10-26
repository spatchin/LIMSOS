Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/dash', as: 'rails_admin'
  resources :feedstocks, except: [:index]
  resources :biomass_types, except: [:index]
  resources :biomasses, except: [:index]
  resources :harvests, except: [:index]

  root 'pages#show', page: 'home'
  get '/:page', to: 'pages#show', as: 'pages'
end
