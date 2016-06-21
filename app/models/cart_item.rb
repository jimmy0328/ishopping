class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def price
    product.price
  end

  def total
    (quantity * product.price).to_i
  end
end
