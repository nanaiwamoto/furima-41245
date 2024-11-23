class Order < ApplicationRecord
  attr_accessor :token, :price

  belongs_to :item
  belongs_to :user
  has_one :order_address
end
