class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  has_many :carted_products
  # User has many orders
  has_many :orders
  has_many :products, :through => :carted_products

  def orders
    # you will find all the Orders associated with this User.
    Order.where(:user_id => id)
  end

end
