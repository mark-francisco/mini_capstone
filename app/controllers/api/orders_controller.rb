class Api::OrdersController < ApplicationController
  
  def index
    if current_user
      @orders = Order.where(:user_id => current_user.id)
      render "index.json.jb"
    else
      render :json => { :message => "you must be logged in to see your orders."}, :status => :unauthorized
    end
  end

  def show
    if current_user && Order.find(params[:id]).user_id == current_user.id
      @order = Order.find(params[:id])
      render "show.json.jb"
    else
      render :json => { :message => "you must be logged in and own this order to see it."}, :status => :unauthorized
    end
  end

  def create
    # current_user comes from application_controller, via the bcrypt gem
    # USER MUST BE LOGGED IN TO CREATE AN ORDER
    if current_user
      @order = Order.new(
        :user_id => current_user.id,
        :product_id => params[:product_id],
        :quantity => params[:quantity],
        :subtotal => Product.find(params[:product_id]).price * params[:quantity].to_i,
        :tax => Product.find(params[:product_id]).tax * params[:quantity].to_i,
        :total => Product.find(params[:product_id]).total * params[:quantity].to_i
      )
      if @order.save
        render :json => { :message => "your Order has been created.", :your_order => @order }
      else
        render :json => { :errors => @product.errors.full_messages }, :status => 406
      end
    else
      render :json => { :message => "you gotta be logged in to create an Order." }, :status => :unauthorized
    end
  end

end
