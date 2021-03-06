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
  	resources :products, except: [:show] do # Back-end for products
      member do # 發佈 / 取消發佈
        post :publish
        post :unpublish
      end
    end
    # Back-end for comments 要放這裡，放到上面 product 底下的話，變成要帶入一個值 product 值才行，這樣太奇怪了。
    resources :comments, only: [:index]
  	resources :categories # Back-end for categories
  end
end
