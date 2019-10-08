Rails.application.routes.draw do
  resources :children
  resources :users
  resources :categories
  resources :memories, only: [:index, :show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
