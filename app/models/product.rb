class Product < ApplicationRecord
  mount_uploader :cover_image, ProductImageUploader
  has_many :product_images, dependent: :destroy
  validates :title, :description, :cost, :price, :cover_image, :display, presence: true
end
