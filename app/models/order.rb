class Order < ApplicationRecord
  # Order belongs to Product & User
  belongs_to :user
  belongs_to :product

  def user
    # you will find 1 User. an order only has 1 User.
    User.find_by(:id => user_id)
  end

  def product
    # you will find 1 Product. right now, an order only has 1 Product.
    Product.find_by(:id => product_id)
  end
   
end
