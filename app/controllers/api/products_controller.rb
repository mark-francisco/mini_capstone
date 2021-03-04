class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end
  
  def show
    @product = Product.find(params[:id])
    render "show.json.jb"
  end
  
  def create
    @product = Product.new(
      :name => params[:name],
      :price => params[:price],
      :image_url => params[:image_url],
      :description => params[:description],
      :current_stock => params[:current_stock]
    )
    # DO NOT FORGET TO SAVE YOUR NEW PRODUCT
    # QUESTION: why does it save when you just type in @product.save?
    if @product.save
      render "show.json.jb"
    else
      render :json => { :errors => @product.errors.full_messages }, :status => 406
    end
  end
  
  def update
    @product = Product.find_by(:id => params[:id])
    
    # set the product's attribute to either the new value, or what it already was if no new value is passed in (aka new value == nil) 
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.current_stock = params[:current_stock] || @product.current_stock
    
    # SAVE YOUR UPDATED PRODUCT TO THE DB. PRODUCT WILL ONLY SAVE IF THE VALIDATIONS IN THE MODEL PASS.
    if @product.save
      # SHOW YOUR NEWLY UPDATED PRODUCT
      render "show.json.jb"
    else
      render :json => { :errors => @product.errors.full_messages }, :status => 406
    end
  end
  
  def destroy
    @product = Product.find_by(:id => params[:id])
    @product.destroy
    # NO NEED TO SAVE A DELETED PROJECT THAT NO LONGER EXISTS
    render :json => { :message => "Product was destroyed!"}
  end



  # def list_product_by_id_query_param
  #   @product = Product.find(params[:product_id])
  #   @product = @product.slice(:id, :name, :price, :image_url, :description)
  #   render "product_by_id.json.jb"
  # end

  # def list_product_by_id_url_segment
  #   @product = Product.find(params[:product_id])
  #   @product = @product.slice(:id, :name, :price, :image_url, :description)
  #   render "product_by_id.json.jb"
  # end

end
