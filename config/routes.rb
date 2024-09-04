Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  #root to: 'articles#index'
  resources :articles

  resources :posts, only: [:index, :new]
  resources :goods, only: [:new, :create, :show, :edit, :update, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
