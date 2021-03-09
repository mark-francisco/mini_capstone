class Api::ImagesController < ApplicationController

  def create
    image = Image.new({
      :name => params[:name],
      :url => params[:url],
      :product_id => params[:product_id] 
    })
    if image.save
      render :json => { :message => "Image successfully created." }
    else
      render :json => { :errors => image.errors.full_messages }, :status => 406
    end
  end


end
