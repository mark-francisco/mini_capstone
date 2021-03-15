class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = CartedProduct.all
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new(
      :user_id => current_user.id,
      :product_id => params[:product_id],
      :quantity => params[:quantity],
      :order_id => nil,
      :status => "carted"
    )
    if @carted_product.save
      render :json => { :message => "your carted product was created." }
    else
      render :json => { :errors => @carted_product.errors.full_messages }, :status => 406
    end
  end

  # def update

  # end

  # def destroy

  # end

end
