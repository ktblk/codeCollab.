Rails.application.routes.draw do

  get 'workspaces/index'

  get 'workspaces/create'

  get 'workspaces/delete'

  get 'workspaces/edit'

  get 'documents/index'

  get 'documents/create'

  get 'documents/delete'

    root to: 'users#new'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    

    get '/signup' => 'users#new'
    # post '/users' => 'users#create'
    resource :users , except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
