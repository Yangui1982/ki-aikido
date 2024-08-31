# Rails.application.routes.draw do
#   devise_for :users
#   root to: 'nouvelles#index'
#   resources :nouvelles, except: [:edit, :update]
#   get "about", to: "pages#about"
#   get "info", to: "pages#info"
#   get "media", to: "pages#media"
#   get "enseignement", to: "pages#enseignement"
#   get "bibliographie", to: "pages#bibliographie"
#   get "dojos", to: "pages#dojos"

#   resources :users do
#     resources :events
#   end
# end
Rails.application.routes.draw do
  devise_for :users

  # Routes pour les événements
  resources :events, only: [:index, :show]

  # Routes pour les actions restreintes aux utilisateurs connectés
  resources :events, only: [:new, :create, :edit, :update, :destroy]

  # Root de l'application (inchangée)
  root to: 'nouvelles#index'

  # Routes pour les autres pages
  resources :nouvelles, except: [:edit, :update]
  get "about", to: "pages#about"
  get "info", to: "pages#info"
  get "media", to: "pages#media"
  get "enseignement", to: "pages#enseignement"
  get "bibliographie", to: "pages#bibliographie"
  get "articles", to: "pages#articles"
  get "dojos", to: "pages#dojos"
end
