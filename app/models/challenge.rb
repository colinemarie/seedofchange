class Challenge < ApplicationRecord
  has_many :user_challenges
  has_many :users, through: :user_challenges

  validates :name, :description, :category, :duration, :difficulty, presence: true
end
