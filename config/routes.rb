Rails.application.routes.draw do
  get 'votes/index'

  get 'votes/search'
  get "main/index"
  get "main/cedula"
  get "main/votar"
  get "main/folleto"
  get "search/create"
  get "search/ocreate"
  get "search/ucreate"
  get "search/votar"
  get "stats/salida"
  get "search/vcreate"
  get "search/getvotes"
  
  resources :places do
    resources :voters do
      get :votar
      get :notfound
    end
    get :asociado
  end
  resources :stats
  devise_for :users
  get 'principal/index'
  root "principal#index"
end
