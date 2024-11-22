class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shopping_region_id, :city, :street_address,
                :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shopping_region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    ActiveRecord::Base.transaction do
      order = Order.create!(
        user_id: user_id,
        item_id: item_id
      )

      OrderAddress.create!(
        postal_code: postal_code,
        shopping_region_id: shopping_region_id,
        city: city,
        street_address: street_address,
        building_name: building_name,
        tel: tel,
        order_id: order.id
      )
    end
  end
end
