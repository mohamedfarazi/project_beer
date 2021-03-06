ProjectBeer::Application.routes.draw do

  root :to => 'users#index'
  resources :charges
  resources :user_sessions
  resources :users do
    member do
      get :activate
    end
  end

  get 'admin' => 'admin/dashboard#index'

  namespace :admin do
    resources :dashboard, :only => [:index]
    resources :subscriptions, :only => [:index]
    resources :users, :only => [:index]
    resources :deliveries, :only => [:new, :create]
    get 'deliveries/upcoming' => 'deliveries#upcoming'
    get 'deliveries/manifest_create' => 'deliveries#manifest_create'
    get 'deliveries/manifest' => 'deliveries#manifest'
    post 'deliveries/manifest' => 'deliveries#delivered'
    get 'users/recent' => 'users#recent'
    get 'subscriptions/recent' => 'subscriptions#recent'
  end

  resources :subscriptions

  resources :plans, :only => [:index]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'denied' => 'pages#denied'
  get 'goodbye' => 'pages#goodbye'
  get 'welcome' => 'pages#welcome'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
