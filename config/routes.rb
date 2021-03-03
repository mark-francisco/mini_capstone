Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id/" => "products#update"
    delete "/products/:id" => "products#destroy"


    #display any single product using a QUERY parameter
    # get "/products" => "products#list_product_by_id_query_param"

    #display any single product using a URL SEGMENT parameter
    # get "/products/:product_id" => "products#list_product_by_id_url_segment"

  end

end
