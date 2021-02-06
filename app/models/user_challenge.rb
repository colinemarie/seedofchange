class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  scope :get_user_challenges, -> (user, status) {where(user: user, status: status)}
  after_update :update_score

  DIFFICULTY_SCORES = [50, 100, 150]

  def update_score
    return unless status == "validated"

    score = user.score
    user.update(score: score + DIFFICULTY_SCORES[challenge.difficulty - 1])
  end
end
