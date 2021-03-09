class Api::OrdersController < ApplicationController
  
  def create
    # current_user comes from application_controller, via the bcrypt gem
    # USER MUST BE LOGGED IN TO CREATE AN ORDER
    if current_user
      @order = Order.new(
        :user_id => current_user.id,
        :product_id => params[:product_id],
        :quantity => params[:quantity],
        # :subtotal => params[:subtotal],
        # :tax => params[:tax],
        # :total => params[:total],
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
