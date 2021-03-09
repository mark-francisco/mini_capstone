class Image < ApplicationRecord
  validates :product_id, :presence => true
end
