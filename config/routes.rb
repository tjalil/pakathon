Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'cities#index'

  match '/404', to: 'errors#file_not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # resources :cities, only: [:index, :show]
  resources :cities, only: [:index]

  # resources :admins, only: [:show] do
  #   resources :cities, only: [:new, :create, :edit, :update] do
  #     member do
  #       get 'dashboard'
  #     end
  #     resources :users, only: [:new, :create, :edit, :update, :destroy]
  #     resources :contacts, only: [:show]
  #   end
  #   resources :logos, only: [:new, :create]
  # end

  resources :admin_sessions, only: [:create, :destroy] do 
    collection do
      get 'dekh_magar_pyar_say'
    end
  end

  # resources :contacts, only: [:new, :create]

  resources :careers, only: [:index]

  resources :pages, :path => '' do
    collection do
      get 'toronto_baithak'
      # get 'dekhmagarpyarsay_homepage_proto'
      get 'program'
      get 'team'
      get 'contact'
    end
  end

  # get "/404", to: 'errors#file_not_found', via: :all
  # get "/500", to: 'errors#internal_server_error', via: :all


  # resources :pages, only: [:index] do
  #   collection do
  #     get 'webinar'
  #   end
  # end
  # resources :toronto_baithak, controller: "pages", only: [:index]
  # resources :toronto_webinar, controller: "pages", only: [:webinar]

  # resources :dekhmagarpyarsaycareers, controller: "careers", only: [:index]

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
