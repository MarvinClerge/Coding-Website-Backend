class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  # create a custom validation for various status strings
end
