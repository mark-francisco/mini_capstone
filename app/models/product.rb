class Product < ApplicationRecord

  validates :image_url, :presence => true
  # https://stackoverflow.com/questions/7540601/rails-how-to-validate-file-format/7540785
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "whatsssuuup"
  validates :current_stock, numericality: { :greater_than_or_equal_to => 0 }
  validates :price, numericality: { :greater_than => 0 }
  validates :name, :uniqueness => true
  validates :description, :length => { :minimum => 20, :maximum => 500}




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
