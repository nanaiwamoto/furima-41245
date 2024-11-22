class OrderAddress < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shopping_region

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shopping_region_id, numericality: { other_than: 1 }
    validates :city
    validates :street_address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
  end
end