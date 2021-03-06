Rails.application.routes.draw do

  # root
  root to: "dashboard#show"

  # devise
  devise_for :users

  # concerns
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: "paginate"
    get '(search/page/:page)', action: :search, on: :collection, as: "search_page"
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

  # search
  post "search", controller: "search", action: "index", as: :search


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
    member do
      get "filter/set_revenue_chart/:period", controller: "contact_filters", action: "set_revenue_chart", as: "set_revenue_chart"
      get "filter/set_product_family_share_chart", controller: "contact_filters", action: "set_product_family_share_chart", as: "set_product_family_share_chart"
      get "filter/set_orders_stats_panel", controller: "contact_filters", action: "set_order_stats_panel", as: "set_order_stats_panel"
    end
  end
  resources :letters, concerns: [:paginatable, :searchable]
  resources :line_items
  resources :materials, concerns: [:paginatable, :searchable] do
    member do
      get "set_period", controller: "materials"
    end
  end
  resources :orders, concerns: [:paginatable, :searchable, :commentable, :dashboardable] do
    member do
      put :mark
      put :complete
    end
    collection do
      get "favorites", action: "favorites", as: "favorite"
      get "scheduled", action: "scheduled", as: "scheduled"
      get "backordered", action: "backordered", as: "backordered"
      get "created/:year/:month/:day", action: "index_created_at", as: "created_at"
    end
  end
  resources :products, concerns: [:paginatable, :searchable, :filterable, :dashboardable]
  resources :product_families
  resources :product_images
  resources :product_inventories do
    resources :product_inventory_items, as: "entries", path: "entries"
  end
  resources :series, concerns: [:commentable, :searchable, :dashboardable] do
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

  scope "products" do
    scope "dashboard" do
      get "set_period", controller: "products", as: "set_products_period"
    end
  end

  scope "orders" do
    scope "dashboard" do
      get "update_revenue_chart", controller: "line_items"
      get "set_period", controller: "orders", as: "set_orders_period"
    end
  end


  # /dashboard/
  namespace :dashboard do
    get :load_revenue_chart
    get :load_product_family_share_chart
    get :load_top_retailers_panel
    get :set_period
  end


  # /api/...
  namespace :api, defaults: { format: "json" } do

    # concerns
    concern :searchable do
      get 'search/:query', action: "search", on: :collection
    end

    # routes
    resources :addresses, concerns: [:searchable]
    resources :backorders do
      collection do
        delete "destroy_by_order/:order_id", action: "destroy_by_order", as: "destroy_by_order"
      end
    end
    resources :employees
    resources :retailers
    resources :comments
    resources :contacts
    resources :contact_information
    resources :discounts
    resources :letters
    resources :line_items
    resources :materials
    resources :material_consumptions
    resources :material_properties
    resources :orders do
      resources :line_items
      delete "line_items", on: :member, action: "destroy_line_items", as: "destroy_line_items"
    end
    resources :products
    resources :product_inventories
    resources :product_inventory_items
    resources :shipments
    resources :series
    resources :series_steps
    resources :series_step_entries
    resources :sizes
  end

# settings
get "settings", action: "settings", controller: "settings"
  
end
