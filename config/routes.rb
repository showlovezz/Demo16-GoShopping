Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mains#index" # Front-end index
  resources :products, only: [:index, :show] do # Front-end for products
    resources :comments, only: [:index, :create, :destroy] # Front-end for comments
  end
  resources :categories, only: [:show] # Front-end for categories

  namespace :admin, path: "mains" do
  	root "mains#index" # Back-end index
  	resources :products, except: [:show] # Back-end for products
  	resources :categories # Back-end for categories
  end
end
