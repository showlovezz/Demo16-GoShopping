Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mains#index" # Front-end index
  resources :products, only: [:index, :show]

  namespace :admin, path: "mains" do
  	root "mains#index" # Back-end index
  	resources :products, except: [:show] # Back-end for products
  	resources :categories # Back-end for categories
  end
end
