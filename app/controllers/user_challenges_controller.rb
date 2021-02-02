class UserChallengesController < ApplicationController
  def index
    @user_challenges = UserChallenge.all.where({ user: current_user, status: "accepted" })
  end

  def create
    number_of_current_challenges = UserChallenge.all.where({ user: current_user, status: "accepted" }).count
    number_of_new_challenges = (5 - number_of_current_challenges)
    # available_challenges = Challenge.all.where
    number_of_new_challenges.times do
      UserChallenge.create(
        user_id: current_user.id,
        challenge_id: tawashi.id
      )
    end
  end

  def show
    @user_challenge = UserChallenge.find(params[:id])
    @week = Date.today.at_beginning_of_week
  end
end
