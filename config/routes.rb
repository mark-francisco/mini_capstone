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

    # USERS
    post "/users" => "users#create"


  end

end
