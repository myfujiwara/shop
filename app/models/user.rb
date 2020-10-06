class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format:{ with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length:{minimum: 8}
  has_many :products
end
