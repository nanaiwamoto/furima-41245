class User < ApplicationRecord
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パスワードの正規表現を定数として定義
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :password, format: {
    with: VALID_PASSWORD_REGEX,
    message: 'must include at least one letter and one number'
  }
end
