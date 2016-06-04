class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :item, through: :cart_items, source: :product

  def add(product)
    ci = cart_items.build
    ci.product = product
    ci.save
  end
end
