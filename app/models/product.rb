class Product < ApplicationRecord

  # # https://stackoverflow.com/questions/7540601/rails-how-to-validate-file-format/7540785
  validates :current_stock, numericality: { :greater_than_or_equal_to => 0 }
  validates :price, numericality: { :greater_than => 0 }
  validates :name, :uniqueness => true
  validates :description, :length => { :minimum => 20, :maximum => 500}


  ####### A PRODUCT BELONGS TO 1 SUPPLIER #########
  # THIS IS THE SAME AS DEFINING THE BELOW METHOD, CALLED "supplier".
  # the "belongs_to" shortcut assumes that the foreign key of the product (the "many" thing) is named "supplier_id", b/c that is how it will find and connect the ONE "id" in supplier to the "supplier_id" of that specific product instance.
  belongs_to :supplier

  # find the 1 Supplier where supplier.id == product.supplier_id 
  # this method gets called from an instance of Product. thus, that product instance is used to assign the concept of "self."
  
  # def supplier
  #   Supplier.find_by(:id => supplier_id)
  # end


  def images
    # find all of the images where images.product_id == product.id
    Image.where(:product_id => id)
  end

  def is_discounted?
    price <= 10
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

end
