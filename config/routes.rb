Rails.application.routes.draw do
  get 'category/title'
  root 'welcome#home'

  resources :users

  resources :children do
    resources :memories
  end

  resources :categories
  # resources :memories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
