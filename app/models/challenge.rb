class Challenge < ApplicationRecord
  has_many :user_challenges

  validates :name, :description, :category, :duration, :difficulty, presence: true
end
