class UserChallengesController < ApplicationController
  def index
    @user_challenges = UserChallenge.all.where({ user: current_user, status: ["accepted", "pending"] })
  end

  def new
  end

  def create
    ##ajouter un while pour un max de 5
    @challenges = Challenge.all
    @challenge = @challenges.sample
    @user_challenge = UserChallenge.new
    @user_challenge.user = current_user
    @user_challenge.challenge = @challenge
    @user_challenge.status = "pending"
    @user_challenge.save
    redirect_to user_challenges_path
  end

end
