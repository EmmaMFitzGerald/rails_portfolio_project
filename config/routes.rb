Rails.application.routes.draw do
  get 'category/title'
  root 'pages#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, except: [:new]

  resources :children do
    resources :memories
  end

  resources :categories
  # resources :memories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
