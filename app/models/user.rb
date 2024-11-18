class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# バリデーションを追加
validates :nickname, presence: true
validates :birth_date, presence: true
validates :last_name, presence: true
validates :first_name, presence: true
validates :last_name_kana, presence: true
validates :first_name_kana, presence: true

# カナ文字のバリデーション（全角カタカナのみ許可）
validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

# 漢字・ひらがな・カタカナのバリデーション
validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }

# パスワードの英数字混合バリデーション
validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

end
