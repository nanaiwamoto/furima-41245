class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_cost
  belongs_to :shopping_region
  belongs_to :shopping_day

  # バリデーション
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  # Active Hashを使用するカラムのバリデーション
  validates :category_id, :condition_id, :shopping_cost_id, :shopping_region_id, :shopping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
