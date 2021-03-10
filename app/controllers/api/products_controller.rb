class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, :except => [:index, :show]


  def index
    @products = Product.all

    # ACTIVE RECORD SEARCH QUERIES:
    # search by name
    if params[:search]
      @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    end
    # sort products by price from lowest to highest
    if params[:sort] == "price"
      @products = @products.order(:price)
    end

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
      :description => params[:description],
      :current_stock => params[:current_stock]
    )
    # DO NOT FORGET TO SAVE YOUR NEW PRODUCT
    # if @product.save is true, the @product.save method is executed.
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


end
