class Api::SuppliersController < ApplicationController
  # when doing rails g controller api/[ControllerName], make sure you use the /api namespace, use PascalCase, and make your controller a plural noun. 

  def index
    @suppliers = Supplier.all
    # ACTIVE RECORD SEARCH QUERIES:
    # search by name
    if params[:search]
      @suppliers = Supplier.where("name ILIKE ?", "%#{params[:search]}%")
    end
    render "index.json.jb"
  end
  
  def show
    @supplier = Supplier.find(params[:id])
    render "show.json.jb"
  end
  
  def create
    @supplier = Supplier.new(
      :name => params[:name],
      :email => params[:email],
      :phone_number => params[:phone_number],
    )
    # DO NOT FORGET TO SAVE YOUR NEW SUPPLIER
    # if @supplier.save is true, the @supplier.save method is executed.
    if @supplier.save
      render "show.json.jb"
    else
      render :json => { :errors => @supplier.errors.full_messages }, :status => 406
    end
  end
  
  def update
    @supplier = Supplier.find_by(:id => params[:id])
  
    # set the supplier's attribute to either the new value, or what it already was if no new value is passed in (aka new value == nil) 
    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
    
    # SAVE YOUR UPDATED SUPPLIER TO THE DB. SUPPLIER WILL ONLY SAVE IF THE VALIDATIONS IN THE MODEL PASS.
    if @supplier.save
      # SHOW YOUR NEWLY UPDATED SUPPLIER
      render "show.json.jb"
    else
      render :json => { :errors => @supplier.errors.full_messages }, :status => 406
    end
  end
  
  def destroy
    @supplier = Supplier.find_by(:id => params[:id])
    @supplier.destroy
    # NO NEED TO SAVE A DELETED PROJECT THAT NO LONGER EXISTS
    render :json => { :message => "Supplier was destroyed!"}
  end





end
