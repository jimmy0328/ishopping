class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :item, through: :cart_items, source: :product
end
