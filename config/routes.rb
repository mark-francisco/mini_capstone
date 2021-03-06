Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    
    # PRODUCTS
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id/" => "products#update"
    delete "/products/:id" => "products#destroy"


    # SUPPLIERS 
    get "/suppliers" => "suppliers#index"
    get "/suppliers/:id" => "suppliers#show"
    post "/suppliers" => "suppliers#create"
    patch "/suppliers/:id/" => "suppliers#update"
    delete "/suppliers/:id" => "suppliers#destroy"

    # IMAGES
    post "/images" => "images#create"

    # USERS
    post "/users" => "users#create"

    # SESSIONS
    post "/sessions" => "sessions#create"

    # ORDERS
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"
    post "/orders" => "orders#create"


    # CARTED PRODUCTS
    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    patch "/carted_products/:id" => "carted_products#update"
    delete "/carted_products/:id" => "carted_products#destroy"

  end

end
