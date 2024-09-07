Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  

  
  resources :goods, only: [:new, :create, :index, :show, :edit, :update]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
