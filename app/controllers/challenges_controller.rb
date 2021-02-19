class ChallengesController < ApplicationController
  def show
    @disable_bell = true
    @challenge = Challenge.find(params[:id])
    @user_challenge = current_user.user_challenges.find_by(challenge: @challenge)
    @already_users = User.includes(:user_challenges).where(clan: current_user.clan, user_challenges: { status: 'validated', challenge: @challenge })
  end
end
