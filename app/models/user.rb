class User < ApplicationRecord
  # nameとemailの入力は必須 nameは15文字まで
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  # passwordの文字列は、半角英数字1文字以上含む8文字から32文字まで
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/ }

  has_secure_password
end
