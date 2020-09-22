Rails.application.routes.draw do






  get 'auctionrecords/index'
  get 'legal_members/new'
  get 'legal_members/create'
  get 'legal_members/destroy'
  get 'appraisals/index'
  get 'emails/index'
  get 'emails/new'
  get 'regions/import' => 'regions#my_import'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'geocoder/findaddress'
  get 'admins/update_role/:user_id/:role_id', to: 'admins#update_role', as: 'admins_update_role'
  get 'admins/index'
  post 'modal_auction', to: 'auctions#modal'

  get 'judgements/searchFilterData', to: 'judgements#searchFilterData'
  get 'realties/searchFilterData', to: 'realties#searchFilterData'
  get 'personas/searchFilterData', to: 'personas#searchFilterData'
  get 'legal_personas/searchFilterData', to: 'legal_personas#searchFilterData'
  
  get 'auctions/searchFilterAuction', to: 'auctions#searchFilterAuction'


  # devise_for :users, controllers: {{     }
  #   registrations: 'users/registrations'}
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }


  get 'dashboard/', to:'dashboard#index'
  get 'calendario/', to: 'calendars#index'






  post 'auctionnotice/:id/reject', to: 'auctionnotices#action_rejection', as: 'rejection'
  get 'auctionnotices/pending'
  get 'auctionnotices/selected'
  get 'auctionnotices/rejected'
  get 'auctionnotices/joined'
  post 'auctionnotice/:id/select', to: 'auctionnotices#action_selection', as: 'action_selection'
  post 'auctionnotice/:id/joined', to: 'auctionnotices#action_joined', as: 'action_joined'






  resources :auctionnotices do
      resources :auctions
      collection do
        put :discontinue
      end
  end

  resources :auctions do
    collection do
       match 'search' => 'auctions#search', via: [:get, :post], as: :search
    end
  end

  resources :realties
  resources  :communes, :provinces, :regions

  resources :courts
  resources :appraisals
  resources :judicialfiles
  resources :auctionrecords


  resources :judgements, :type_realties
  resources :type_realties
  resources :legal_personas do
      resources :directions
      resources :phones
      resources :emails
      resources :activities
      resources :domains


      end


  resources :persona_members
  resources :legal_members



  resources :personas do
    resources :jobs,:directions,:phones,:emails,:domains,:activities
  end



  resources :comments
  resources :posts
  resources :auctionlistings
  resources :domains do
    resources :inscriptions
  end
resources :inscriptions

resources :condominios




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  #root to: 'auctions#index'

end
