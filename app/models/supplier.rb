class Supplier < ApplicationRecord

  # validates :name, :presence => true
  # validates :email, :presence => true
  # validates :phone_number, :presence => true

  ####### A SUPPLIER HAS MANY PRODUCTS #########
  # THIS IS THE SAME AS DEFINING THE BELOW METHOD, CALLED "products".
  # the "has_many" shortcut assumes that the foreign key of the product (the "many" thing) is named "supplier_id", b/c that is how it will find and connect the "supplier_id" of the MANY products to the "id" of that specific supplier instance.
  has_many :products

  # def products
  #   # find all of the products where product.supplier_id == supplier.id
  #   Product.where(:supplier_id => id)
  # end
  
end
