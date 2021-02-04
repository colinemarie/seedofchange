class UserChallengesController < ApplicationController
  def index
    @user_challenges = UserChallenge.all.where({ user: current_user, status: ["accepted"] })
  end

  def create
    ##ajouter un while pour un max de 5
    @challenges_id = UserChallenge.all.where(user: current_user).map(&:challenge_id)
    @challenges = Challenge.all.where.not(id: @challenges_id)
    @challenge = @challenges.sample
    @user_challenge = UserChallenge.new
    @user_challenge.user = current_user
    @user_challenge.challenge = @challenge
    @user_challenge.save
    redirect_to user_challenge_path(@user_challenge)
  end

  def show
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenges_ongoing = UserChallenge.all.where({ user: current_user, status: ["accepted"] }).count
    @current_week = Date.today.strftime('%d %b %Y')
  end

  def accept
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenge.update(status: "accepted")
    @user_challenges_ongoing = UserChallenge.all.where({ user: current_user, status: ["accepted"] }).count
    if @user_challenges_ongoing >= 5
      render "user_challenges/end"
    else
      redirect_to user_challenges_path
    end
  end

  def decline
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenge.update(status: "declined")
    @user_challenges_ongoing = UserChallenge.all.where({ user: current_user, status: ["pending", "accepted"] }).count
    if @user_challenges_ongoing >= 5
      render "user_challenges/end"
    else
      redirect_to user_challenges_path
    end
  end

  def drop
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.where(challenge: @challenge)
    @user_challenge.update(status: "dropped")
    redirect_to user_challenges_path
  end

  def validate
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.where(challenge: @challenge)
    @user_challenge.update(status: "validated")
    redirect_to user_challenges_path
  end
end
