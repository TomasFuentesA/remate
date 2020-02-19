Rails.application.routes.draw do

  get 'legal_people/index'
  get 'natural_people/index'
  get 'natural_people/new'
  get 'natural_people/edit'
  get 'natural_people/update'
  get 'natural_people/create'
  resources :comments
  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'geocoder/findaddress'
  get 'admins/update_role/:user_id/:role_id', to: 'admins#update_role', as: 'admins_update_role'
  get 'admins/index'

  # devise_for :users, controllers: {{     }
  #   registrations: 'users/registrations'}
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }


  resources :auctionlistings

  post 'auctionnotice/:id/reject', to: 'auctionnotices#action_rejection', as: 'rejection'
  get 'auctionnotices/pending'
  get 'auctionnotices/selected'
  get 'auctionnotices/rejected'
  post 'auctionnotice/:id/select', to: 'auctionnotices#action_selection', as: 'action_selection'


  get 'auctionnotice/:id/auctions', to: 'auctionnotices#auctions', as: 'auctionnotice_auction'


  resources :auctionnotices do
      resources :auctions
  end

  resources :auctions

  resources :realties

  resources :communes
  resources :provinces
  resources :regions
  resources :legal_people

  resources :courts


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'auctions#index'
end
