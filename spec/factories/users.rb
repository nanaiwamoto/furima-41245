FactoryBot.define do
  factory :user do
    nickname { "ExampleUser" }
    sequence(:email) { |n| "user#{n}@example.com" }  # メールアドレスの重複を避けるため
    password { 'abc123' }  # 英数字混合のパスワード
    password_confirmation { 'abc123' }  # 同じパスワードを設定
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    birth_date { "1990-01-01" }
  end
end