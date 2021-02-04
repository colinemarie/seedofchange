class UserChallengesController < ApplicationController
  def index
    @user_challenges = UserChallenge.all.where({ user: current_user, status: ["accepted"] })
  end

  def create
    @user_challenges_ongoing = UserChallenge.all.where({ user: current_user, status: ["accepted"] }).count
    @used_challenges_id = UserChallenge.all.where(user: current_user).map(&:challenge_id)
    @challenges = Challenge.all.where.not(id: @used_challenges_id).sample(7 - @user_challenges_ongoing)
    @user_challenges = []
    @challenges.each do |challenge|
      @user_challenges << UserChallenge.create(challenge: challenge, user: current_user, status: "pending")
    end
    redirect_to user_challenge_path(@user_challenges.first)
    # @user_challenge = UserChallenge.new
    # @user_challenge.user = current_user
    # @user_challenge.challenge = @challenge
    # @user_challenge.save
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
    @next_challenge = UserChallenge.find(@user_challenge.id + 1)
    if @next_challenge && @user_challenges_ongoing < 5
      redirect_to user_challenge_path(@next_challenge)
    else
      render "user_challenges/end"
    end
  end

  def decline
    @user_challenge = UserChallenge.find(params[:id])
    @user_challenge.update(status: "declined")
    @user_challenges_ongoing = UserChallenge.all.where({ user: current_user, status: ["accepted"] }).count
    @next_challenge = UserChallenge.find(@user_challenge.id + 1)
    if @next_challenge && @user_challenges_ongoing < 5
      redirect_to user_challenge_path(@next_challenge)
    else
      render "user_challenges/end"
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
