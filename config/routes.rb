Manufaktur::Application.routes.draw do

  # root
  root to: "contacts#index"

  # devise
  devise_for :users

  # concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, :as => ''
    get '(search/page/:page)', action: :search, on: :collection, :as => 'search_page'
  end
  
  concern :searchable do
    match 'search', action: :search, on: :collection, via: [:get, :post], as: :search
  end

  concern :commentable do
    resources :comments do
      get :cancel, controller: "comments", action: "cancel", as: "cancel"
    end
  end

  concern :dashboardable do
    get :dashboard, action: "dashboard", on: :collection, as: "dashboard"
  end

  concern :filterable do
    get "(filter/:filter)", action: "filter", on: :collection, as: :filter
  end


  # orders
  get "orders/marked_orders" => "orders#get_marked_orders", :as => "marked_orders"

  # resources
  resources :api_keys
  resources :addresses
  resources :brands
  resources :contacts, concerns: [:paginatable, :searchable, :commentable, :filterable] do
    collection do
      get "retailers"
      get "employees"
      get "suppliers"
      get "customers"
    end
  end
  resources :letters, concerns: [:paginatable, :searchable]
  resources :line_items
  resources :materials
  resources :orders, concerns: [:paginatable, :searchable, :commentable, :dashboardable] do
    member do
      post :update_addresses
      put :mark
      put :complete
    end
    collection do
      get "favorites", action: "favorites", as: "favorite"
      get "created/:year/:month/:day", action: "index_created_at", as: "created_at"
    end
  end
  resources :product_images
  resources :products, concerns: [:paginatable, :searchable, :filterable]
  resources :series, concerns: [:commentable] do
    resources :series_steps
  end
  resources :size_sets
  resources :variations
  resources :variation_sets
  resources :work_steps


  # ajax
  scope "line_items" do
    post "change_quantity", controller: "line_items", action: "change_quantity", as: "change_quantity"
    post "select_product", controller: "line_items", action: "select_product"
  end


  # /api/...
  namespace :api, defaults: { format: "json" } do

    # concerns
    concern :searchable do
      get 'search/:query', action: "search", on: :collection
    end

    # routes
    resources :addresses, concerns: [:searchable]
    resources :employees
    resources :retailers
    resources :comments
    resources :contacts
    resources :contact_information
    resources :letters
    resources :line_items
    resources :materials
    resources :material_consumptions
    resources :material_properties
    resources :orders do
      resources :line_items
    end
    resources :products, concerns: [:searchable]
    resources :series
    resources :series_steps
    resources :series_step_entries
    resources :sizes
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  
end
