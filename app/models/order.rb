class Order < ApplicationRecord
  belongs_to :user
  has_one :info, class_name: "OrderInfo", dependent: :destroy, inverse_of: :order
  has_many :items, class_name: "OderItems", dependent: :destroy
end
