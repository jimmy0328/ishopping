class Order < ApplicationRecord

  belongs_to :user

  has_one :info, class_name: "OrderInfo", dependent: :destroy
  has_many :items, class_name: "OderItems", dependent: :destroy

  accepts_nested_attributes_for :info
end
