Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'category/title'

  get '/memories', to:'memories#all_memories'
  


  resources :children do
    resources :memories
  end

  resources :categories
  # resources :memories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
