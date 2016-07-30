Rails.application.routes.draw do

  resource :users do
    resources :documents
  end

  get 'workspace' => 'workspaces#index'

    root to: 'documents#index'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'


    get '/signup' => 'users#new'
    # post '/users' => 'users#create'
    resource :users , except: [:index]
    # For details on the DSL available within this file, see  http://guides.rubyonrails.org/routing.html
end
