class Category < ApplicationRecord
  has_many :category_products
  has_many :products, :through => :category_products


  def products
    # find ALL of the CategoryProduct instances that belong to this Category
    products = CategoryProduct.where(:category_id => id).map { |category_product|
      Product.find_by(:id => category_product.product_id)
    }
    
  end
end
