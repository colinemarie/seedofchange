class UserChallengesController < ApplicationController
  def index
    @user_challenges = UserChallenge.all.where({ user: current_user, status: "accepted" })
  end

  def create
  end

  def show
    @user_challenge = UserChallenge.find(params[:id])
    # @user_challenge = @user_challenges.first
    # @week = Date.today.at_beginning_of_week
  end
end
