Rails.application.routes.draw do

  resource :users do
    resources :documents
  end
  get 'documents/retreive/:file_id' => 'documents#retreiver'


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'workspace' => 'workspaces#index'

    root to: 'documents#index'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'


    get '/signup' => 'users#new'
    # post '/users' => 'users#create'
    resource :users , except: [:index]
    # For details on the DSL available within this file, see  http://guides.rubyonrails.org/routing.html
     get '/gen_token' => 'workspaces#gen_token'
end
