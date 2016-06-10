class OrderInfo < ApplicationRecord
  belongs_to :order, inverse_of: :order_info
end
