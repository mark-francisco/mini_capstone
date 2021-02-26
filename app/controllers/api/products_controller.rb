class Api::ProductsController < ApplicationController

  def list_all_products
    @products = Product.all
    render "all_products.json.jb"
  end

  def list_first_product
    @product = Product.first
    render "first_product.json.jb"
  end

  def list_product_by_id_query_param
    @product = Product.find(params[:product_id])
    @product = @product.slice(:id, :name, :price, :image_url, :description)
    render "product_by_id.json.jb"
  end

  def list_product_by_id_url_segment
    @product = Product.find(params[:product_id])
    @product = @product.slice(:id, :name, :price, :image_url, :description)
    render "product_by_id.json.jb"
  end

end
