class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @user_challenge = current_user.user_challenges.find_by(challenge: @challenge)
  end
end
