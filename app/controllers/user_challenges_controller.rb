class UserChallengesController < ApplicationController
  before_action :set_user_challenge, only: [:show, :accept, :decline, :drop, :validate]

  def index
    @user_challenges = UserChallenge.where({ user: current_user, status: ["accepted"] })
  end

  def create
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @undone_challenges = (Challenge.all - current_user.challenges).sample(7 - @user_challenges_ongoing)
    return if @undone_challenges.empty?

    @user_challenges = []
    @undone_challenges.each do |challenge|
      @user_challenges << UserChallenge.create(challenge: challenge, user: current_user, status: 'pending')
    end
    redirect_to user_challenge_path(@user_challenges.first)
  end

  def show
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @current_week = Date.today.strftime('%d %b %Y')
  end

  def accept
    @user_challenge.update(status: "accepted")
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @user_challenges_pending = UserChallenge.get_user_challenges(current_user, 'pending')
    if !@user_challenges_pending.empty? && @user_challenges_ongoing < 5
      redirect_to user_challenge_path(@user_challenges_pending.first)
    else
      render "user_challenges/end"
    end
  end

  def decline
    @user_challenge.update(status: "declined")
    @user_challenges_ongoing = UserChallenge.get_user_challenges(current_user, 'accepted').count
    @user_challenges_pending = UserChallenge.get_user_challenges(current_user, 'pending')
    if !@user_challenges_pending.empty? && @user_challenges_ongoing < 5
      redirect_to user_challenge_path(@user_challenges_pending.first)
    else
      render "user_challenges/end"
    end
  end

  def drop
    @user_challenge.update(status: "dropped")
    redirect_to user_challenges_path
  end

  def validate
    @user_challenge.update(status: "validated")
    redirect_to user_challenges_path
  end

  private

  def set_user_challenge
    @user_challenge = UserChallenge.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
