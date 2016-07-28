Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
   get 'auth/failure', to: redirect('/')


  get 'sessions/create'

  get 'sessions/destroy'

  get 'workspaces/index'

  get 'workspaces/create'

  get 'workspaces/delete'

  get 'workspaces/show'

  get 'workspaces/edit'

  get 'documents/index'

  get 'documents/create'

  get 'documents/delete'

  get 'documents/show'

    root to: 'documents#index'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'


    get '/signup' => 'users#new'
    # post '/users' => 'users#create'
    resource :users , except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
