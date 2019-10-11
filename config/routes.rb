Rails.application.routes.draw do
  get 'category/title'
  root 'pages#home'
  # match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/memories', to:'memories#all_memories'
  
  resources :users, except: [:new]

  resources :children do
    resources :memories
  end

  resources :categories
  # resources :memories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
