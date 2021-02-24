Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/all_products" => "products#list_all_products"

    # not scalable rn, b/c each new product is hardcoded to a different route. \
    # also, the controller is hardcoding each individual product in an instance variable.
    get "/product_1" => "products#list_first_product"
  end

end
