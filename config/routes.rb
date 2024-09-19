Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  

  
  resources :goods do
    resources :destinations, only: [:index, :new, :create], shallow: true
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
