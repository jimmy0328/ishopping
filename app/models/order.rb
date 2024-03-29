class Order < ApplicationRecord

  has_secure_token

  belongs_to :user
  has_one  :info,  class_name: "OrderInfo", dependent: :destroy
  has_many :items, class_name: "OrderItem", dependent: :destroy

  accepts_nested_attributes_for :info, reject_if: :all_blank

  def build_item_cache_from_cart(cart)
    cart.items.each do |cart_item|
      item = items.build
      item.product_name = cart_item.title
      item.quantity = 1
      item.price = cart_item.price
      item.save
    end
  end

  def calculate_total!(cart)
    self.total = cart.total_price
    self.save
  end
end
