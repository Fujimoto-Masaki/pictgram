class User < ApplicationRecord
  # nameは入力必須、最大15文字まで
  validates :name, presence: true, length: { maximum: 15 }
  # emailは入力必須、~@~.~の入力形式
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  # passwordの文字列は、半角英数字1文字以上含む8文字から32文字まで
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
