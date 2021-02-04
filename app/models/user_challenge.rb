class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  scope :get_user_challenges, -> (user, status) {where(user: user, status: status)}
end
