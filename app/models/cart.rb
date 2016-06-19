class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items, source: :product


  def clean!
    cart_items.destroy_all
  end

  def add(product)
    ci = cart_items.build
    ci.product = product
    ci.save
  end

  def price
    items.map(&:price).sum
  end

end
