class ProductImage < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  belons_to :product
end
