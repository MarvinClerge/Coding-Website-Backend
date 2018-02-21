class User < ApplicationRecord
  has_many :user_challenges
  has_many :comments
  has_many :codes
  has_many :challenges, through: :user_challenges

  has_secure_password
end
