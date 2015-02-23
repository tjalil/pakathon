Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'cities#index'

  resources :cities, only: [:index, :show]

  resources :admins, only: [:show] do
    resources :cities, only: [:new, :create, :edit, :update] do
      member do
        get 'dashboard'
      end
      resources :users, only: [:new, :create, :edit, :update, :destroy]
      resources :contacts, only: [:show]
    end
    resources :logos, only: [:new, :create]
  end

  resources :admin_sessions, only: [:create, :destroy] do 
    collection do
      get 'dekh_magar_pyar_say'
    end
  end

  resources :contacts, only: [:new, :create]

  # resources :pages, only: [:index]
  resources :torontocafe, controller: "pages", only: [:index]

  resources :careers, only: [:index]

  # post 'logout' => 'admin_sessions#destroy', :as => :logout

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
