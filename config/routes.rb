Rails.application.routes.draw do
  
  resources :representante_historicos
  resources :historicos
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
  post 'realties/createUpload', to: 'realties#createUpload'
  delete 'realties/deleteUpload', to: 'realties#deleteUpload'
  get 'personas/searchFilterData', to: 'personas#searchFilterData'
  get 'legal_personas/searchFilterData', to: 'legal_personas#searchFilterData'
  get 'list_domain/:domainable_id', to: 'domains#list_domain', as: 'listado_creadores'


  # devise_for :users, controllers: {{     }
  #   registrations: 'users/registrations'}
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }


  get 'dashboard/', to:'dashboard#index'
  get 'calendario/', to: 'calendars#index'
  get 'calendario_garantias/', to: 'calendars#index_warranty'







  post 'auctionnotice/:id/reject', to: 'auctionnotices#action_rejection', as: 'rejection'
  get 'auctionnotices/pending'
  get 'auctionnotices/selected'
  get 'auctionnotices/rejected'
  get 'auctionnotices/joined'
  post 'auctionnotice/:id/select', to: 'auctionnotices#action_selection', as: 'action_selection'
  post 'auctionnotice/:id/joined', to: 'auctionnotices#action_joined', as: 'action_joined'


  get '/judgement_debts/new/:id_judgement/auction/:id_auction', to: 'judgement_debts#new_from_auctions', as: 'new_from_auctions'

  get 'auctions/:id/update_status_auctions', to: 'auctions#update_status_auctions', as: 'update_status_auctions'



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

  resources :judgement_debts
  resources :realties
  resources  :communes, :provinces, :regions
  resources :documents
  resources :courts
  resources :appraisals
  resources :judicialfiles
  resources :inscriptionfiles
  resources :domainfiles
  resources :compradors
  resources :domain_rols do 
    resources :compradors
  end
  resources :judgements, :type_realties
  resources :type_realties
  resources :legal_personas do
      resources :directions
      resources :phones
      resources :emails
      resources :domain_rols do
        resources :persona_members
      end
      resources :activities
      resources :compradors do
        resources :persona_members
      end
      resources :domains 
      resources :persona_members
      resources :legal_represents
      end


  resources :persona_members
  resources :legal_members
  resources :legal_represents


  resources :personas do
    resources :jobs,:directions,:phones,:emails,:domains,:activities
  end



  resources :comments
  resources :posts
  resources :auctionlistings
  resources :domains do
    resources :inscriptions
    resources :domainfiles
  end
resources :inscriptions do
  resources :inscriptionfiles
end

resources :condominios




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  #root to: 'auctions#index'

end
