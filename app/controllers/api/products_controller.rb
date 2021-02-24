class Api::ProductsController < ApplicationController

  def list_all_products
    @products = Product.all
    render "all_products.json.jb"
  end

  def list_first_product
    @product = Product.first
    render "first_product.json.jb"
  end

end
