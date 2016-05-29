class ProductImage < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  belongs_to :product
end
