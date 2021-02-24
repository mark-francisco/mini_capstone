class Api::ProductsController < ApplicationController

  def list_all_products
    @products = Product.all
    render "all_products.json.jb"
  end

end
