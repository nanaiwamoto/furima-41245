class CreateOrderAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :order_addresses do |t|
      t.string :postal_code, null: false
      t.integer :shopping_region_id, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building_name
      t.string :tel, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
