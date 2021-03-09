class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true

  # User has many orders
  has_many :orders

  def orders
    # you will find all the Orders associated with this User.
    Order.where(:user_id => id)
  end

end
