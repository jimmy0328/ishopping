class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
end
