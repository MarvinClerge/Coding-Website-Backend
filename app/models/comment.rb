class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :content, presence: true, length: {minimum: 2, maximum: 300}
end
