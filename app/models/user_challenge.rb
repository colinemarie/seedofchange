class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  scope :get_user_challenges, -> (user, status) {where(user: user, status: status)}
  after_update :update_score_user

  DIFFICULTY_SCORES = [50, 100, 150]

  def update_score_user
    return unless status == "validated"

    score_user = user.score
    score_clan = user.clan.score
    user.update(score: score_user + DIFFICULTY_SCORES[challenge.difficulty - 1])
    user.clan.update(score: score_clan + DIFFICULTY_SCORES[challenge.difficulty - 1])
  end
end
