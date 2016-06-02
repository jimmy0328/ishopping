class Product < ApplicationRecord
  mount_uploader :cover_image, ProductImageUploader
  has_many :product_images, dependent: :destroy
  validates :title, :description, :cost, :price, presence: true
end
