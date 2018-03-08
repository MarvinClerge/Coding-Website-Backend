class Challenge < ApplicationRecord
  has_many :comments
  has_many :user_challenges
  belongs_to :user
  has_many :users, through: :user_challenges

  validates :title,:description,:test_value,:test_description,:test_expected, presence: true
end
