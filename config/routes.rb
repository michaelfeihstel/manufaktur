Filialen::Application.routes.draw do

  # orders

  get "orders/marked_orders" => "orders#get_marked_orders", :as => "marked_orders"

  # resources

  resources :product_images
  resources :brands
  resources :products 
  resources :sizes
  resources :variations
  resources :variation_sets
  resources :contacts
  resources :addresses
  resources :orders do
    member do
      post :update_addresses
      put :mark
      put :complete
    end
    collection do
      get "created/:year/:month/:day" => "orders#index_created_at", :as => "created_at"
      match "search" => "orders#search", via: [:get, :post], as: "search"
    end
  end
  resources :line_items
  resources :letters do
    collection do
      get 'page/:page', action: :index
    end
  end



  get "home/index"


  match "line_items/select_product" => "line_items#select_product", :via => :post
  match "line_items/change_quantity" => "line_items#change_quantity", :via => :post

  root :to => "home#index"

  # /api/...

  namespace :api, defaults: { format: "json" } do
    resources :addresses
    resources :contacts
    resources :contact_information
    resources :letters
    resources :line_items
    resources :orders
    resources :products
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
