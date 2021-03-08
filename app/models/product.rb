class Product < ApplicationRecord

  # # https://stackoverflow.com/questions/7540601/rails-how-to-validate-file-format/7540785
  # validates :image_url, :presence => true
  # validates :current_stock, numericality: { :greater_than_or_equal_to => 0 }
  # validates :price, numericality: { :greater_than => 0 }
  # validates :name, :uniqueness => true
  # validates :description, :length => { :minimum => 20, :maximum => 500}


  def supplier
    Supplier.find_by(:id => supplier_id)
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
